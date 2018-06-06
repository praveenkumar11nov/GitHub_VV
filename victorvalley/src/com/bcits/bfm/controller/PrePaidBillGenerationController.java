package com.bcits.bfm.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.ResourceBundle;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.codehaus.jettison.json.JSONException;
import org.hibernate.Hibernate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bcits.bfm.model.Address;
import com.bcits.bfm.model.Contact;
import com.bcits.bfm.model.ElectricityBillEntity;
import com.bcits.bfm.model.Person;
import com.bcits.bfm.model.PrePaidMeters;
import com.bcits.bfm.model.PrepaidBillDetails;
import com.bcits.bfm.model.PrepaidBillDocument;
import com.bcits.bfm.model.PrepaidCalcuStoreEntity;
import com.bcits.bfm.model.PrepaidCalculationBasisEntity;
import com.bcits.bfm.model.PrepaidTxnChargesEntity;
import com.bcits.bfm.model.Property;
import com.bcits.bfm.service.PrePaidMeterService;
import com.bcits.bfm.service.PrepaidBillDocService;
import com.bcits.bfm.service.PrepaidBillService;
import com.bcits.bfm.service.PrepaidCalcuStoreService;
import com.bcits.bfm.service.PrepaidDailyConsumService;
import com.bcits.bfm.service.PrepaidPaymentAdjustmentService;
import com.bcits.bfm.service.PrepaidServiceMasterSs;
import com.bcits.bfm.service.PrepaidTransactionService;
import com.bcits.bfm.service.billingCollectionManagement.AdjustmentService;
import com.bcits.bfm.service.customerOccupancyManagement.PersonService;
import com.bcits.bfm.service.customerOccupancyManagement.PropertyService;
import com.bcits.bfm.util.JsonResponse;
import com.bcits.bfm.util.NumberToWord;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRPrintPage;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import com.itextpdf.text.pdf.PdfStructTreeController.returnType;

@Controller
public class PrePaidBillGenerationController {
	
	final Logger logger=LoggerFactory.getLogger(PrePaidBillGenerationController.class);
	
	@PersistenceContext(unitName="bfm")
    protected EntityManager entityManager;
	
	@Autowired
	private PrepaidBillService prepaidBillService;
	
	@Autowired
	private AdjustmentService adjustmentService; 
	
	@Autowired
	private PrepaidBillDocService prepaidBillDocService;
	
	@Autowired
	private PersonService personService;
	
	@Autowired
	private PrepaidTransactionService transactionService;
	
	@Autowired
	private PrePaidMeterService prepaidMeterService;
	
	@Autowired
	private PrepaidPaymentAdjustmentService prepaidPaymentAdjustmentService;
	 
	@Autowired
	private PrepaidCalcuStoreService  prepaidCalcuStoreService;
	
	@Autowired
	private PrepaidServiceMasterSs prepaidServiceMasterSs;
	
	@Autowired
	private PropertyService propertyService;
	
	@Autowired
	private PrepaidDailyConsumService prepaidDailyConsumService;
	
	@RequestMapping(value="/Calculate")
	public String index(){
		return "serviceChargesCalcu";
	}
	
	 @RequestMapping(value="/serviceChargeCalcu/getMeterNumberUrl", method={RequestMethod.GET,RequestMethod.POST})
	 public @ResponseBody List<?> readMeterNums(){
		 
		 List<Map<String, Object>> resultList=new ArrayList<>();
		 Map<String, Object> mapList=null;
		 List<?> adjustList=prepaidPaymentAdjustmentService.readMeters();
		 for(Iterator<?> iterator=adjustList.iterator();iterator.hasNext();){
			 final Object[] value=(Object[]) iterator.next();
			 mapList=new HashMap<>();
			// mapList.put("propertyId", value[0]);
			 mapList.put("consumerId", value[1]);
			// mapList.put("propertyId", value[2]);
			 resultList.add(mapList);
		 }
		 
		 return resultList;
	 }
	
	@RequestMapping(value="/serviceChargeCalcu/calculateCharges",method={RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Object generateBill(HttpServletRequest req,
			HttpServletResponse response)
			throws ParseException, JSONException, IOException{
	
	  String serviceID=req.getParameter("serviceId");
	  String fromDate= req.getParameter("fromDate");
	  String toDate=req.getParameter("toDate");
	  String propertyId=req.getParameter("propertyId");
	  String blockName=req.getParameter("blockName");
	  int blockId=Integer.parseInt(req.getParameter("blocId"));
	  JsonResponse erResponse=new JsonResponse();
	  PrintWriter out;
	  Date minDate=null;
	  Date maxDate=null;
	  logger.info("serviceID "+serviceID+", "+"fromDate "+fromDate+", "+"toDate "+toDate+", "+"blockName "+blockName +", "+"propertyId "+propertyId);
	  long   serviceid=(long) entityManager.createQuery("select COUNT(p.serviceId) from PrepaidServiceMaster p where p.serviceId="+serviceID+"and p.status='Active'").getSingleResult();
	  if(serviceid!=0){
	  List<Map<String, Object>> datelist=prepaidServiceMasterSs.getMinMaxDate(Integer.parseInt(serviceID));
	  for (Map<String, Object> date : datelist) {
		  for(Entry<String, Object> maEntry : date.entrySet()){
			  if(maEntry.getKey().equalsIgnoreCase("fromDate")){
				  minDate=(Date) maEntry.getValue();
				  System.err.println(minDate);
			  }
			  if(maEntry.getKey().equalsIgnoreCase("toDate")){
				  maxDate=(Date) maEntry.getValue();
				  System.err.println(maxDate);
			  }
		  }
	   }
	  Date frDate=new SimpleDateFormat("dd/MM/yyyy").parse(fromDate);
	  Date todate=new SimpleDateFormat("dd/MM/yyyy").parse(toDate);
	  Calendar cal=Calendar.getInstance();
	  cal.setTime(frDate);
	  int noofDays=cal.getActualMaximum(Calendar.DAY_OF_YEAR);
	  if(maxDate.compareTo(frDate)<0){
		 erResponse.setResult("Charges Rates Valid From "+minDate+ "Valid To "+maxDate);
		 return erResponse;
	  }else if(maxDate.compareTo(todate)<0){
		  erResponse.setResult("Charges Rates Valid From "+minDate+ "Valid To "+maxDate);
			 return erResponse;
	  }
	  else{
	    String camma=",";
	    String[] propList=propertyId.split(camma);
	    int count1=0;
	 // List<String> meterId=prepaidMeterService.getMeterNumber();
	  String cbName=(String) entityManager.createQuery("select pc.cbName from PrepaidCalculationBasisEntity pc where pc.sId="+serviceID).getSingleResult();
      List<PrepaidTxnChargesEntity> prEntities=transactionService.getall(Integer.parseInt(serviceID));
	   for(int i=0; i<propList.length;i++){	
		int propId=Integer.parseInt(propList[i]);
		Object[] prePaidMeters=prepaidMeterService.getserviceStartDate(propId);
		if(prePaidMeters[0]!=null){
		String meterNumber=prepaidMeterService.getMtrNo(propId);
		String service_Name=(String) entityManager.createQuery("select p.service_Name from PrepaidServiceMaster p where p.serviceId="+serviceID).getSingleResult();
		Date maxdate=prepaidCalcuStoreService.getMAxDate(meterNumber,service_Name);
		System.err.println("MAX DATE :"+maxdate);
	
		
		List<Object[]> dailyData=new ArrayList<>();
		dailyData=prepaidDailyConsumService.getConsumptionDetails(frDate,todate,meterNumber);
		
		System.out.println("list size++++++++++"+dailyData.size());
		if(dailyData.size()!=0){
		int area=0;
		int personId=prepaidMeterService.getPersonId(propId);
		
		 area=(int) entityManager.createQuery("select p.area from Property p where p.propertyId="+propId).getSingleResult();
		for (Object[] objects : dailyData) {
			
			String readingDate=new SimpleDateFormat("dd/MM/yyyy").format((Date)objects[2]);
			//System.out.println(readingDate);
			long count=prepaidCalcuStoreService.checkDataExistence(propId,readingDate,service_Name);
			logger.info("count "+count);
			if(!(count>0)){
	   if(cbName.equalsIgnoreCase("AREA")){
		   List<PrepaidCalcuStoreEntity> list=new ArrayList<>();
		   double  consumAmt=0.0;
		   for (PrepaidTxnChargesEntity prepaidTxnChargesEntity : prEntities) {
			  String chargeTpe=prepaidTxnChargesEntity.getCharge_Type(); 
			   if(chargeTpe.equals("Charge")){
				   double  rate=prepaidTxnChargesEntity.getRate();
				   consumAmt=(area*rate*12)/noofDays;
			   }
		   }
		   for (PrepaidTxnChargesEntity prepaidTxnChargesEntity : prEntities) {
			   PrepaidCalcuStoreEntity prStoreEntity=new PrepaidCalcuStoreEntity();
		    	double rate=prepaidTxnChargesEntity.getRate();
		    	String chargeName=prepaidTxnChargesEntity.getCharge_Name();
		    	String chargeTpe=prepaidTxnChargesEntity.getCharge_Type(); 
		   	   String   serviceName=(String) entityManager.createQuery("select p.service_Name from PrepaidServiceMaster p where p.serviceId="+prepaidTxnChargesEntity.getSid()).getSingleResult();
		    
		   if(chargeTpe.equals("Charge")){
			prStoreEntity.setRate(String.valueOf(rate));
			prStoreEntity.setDaily_Consumption_Amt(consumAmt);
			prStoreEntity.setChargeName(chargeName);
			
		   }else{
			   
			  double  consumAmt1=(consumAmt*rate)/100;
			    prStoreEntity.setRate(String.valueOf(rate));
			    prStoreEntity.setDaily_Consumption_Amt(consumAmt1);
			    prStoreEntity.setChargeName(chargeName);
		   }
		   prStoreEntity.setArea(area);
		   prStoreEntity.setPersonId(personId);
		   prStoreEntity.setPropertyId(propId);
		   prStoreEntity.setCbName(cbName);
		   prStoreEntity.setServiceName(serviceName);
		   prStoreEntity.setDaily_Units_Consumed(0.0);
		   prStoreEntity.setMeterNo(objects[1]+"");
		   prStoreEntity.setReadingDate(readingDate);
		   list.add(prStoreEntity);
		   prepaidCalcuStoreService.save(prStoreEntity);
		   }
		 
	   }else if(cbName.equalsIgnoreCase("UNIT")){
		  
		   double consumAmt=0.0;
		   double units=0.0;
		   for (PrepaidTxnChargesEntity prepaidTxnChargesEntity : prEntities) {
			  String chargeTpe=prepaidTxnChargesEntity.getCharge_Type();
			  String   serviceName=(String) entityManager.createQuery("select p.service_Name from PrepaidServiceMaster p where p.serviceId="+prepaidTxnChargesEntity.getSid()).getSingleResult();
			   if(chargeTpe.equals("Charge")){
				   if(serviceName.equalsIgnoreCase("DG")){
				   double  rate=prepaidTxnChargesEntity.getRate();
				    units=Double.parseDouble(objects[4]+"");
				   consumAmt=rate*units;
				   }else{
					   double  rate=prepaidTxnChargesEntity.getRate();
					    units=Double.parseDouble(objects[3]+"");
					   consumAmt=rate*units;
				   }
			   }
		   }
		   for (PrepaidTxnChargesEntity prepaidTxnChargesEntity : prEntities) {
			   PrepaidCalcuStoreEntity prStoreEntity=new PrepaidCalcuStoreEntity();
		    	double rate=prepaidTxnChargesEntity.getRate();
		    	String chargeName=prepaidTxnChargesEntity.getCharge_Name();
		    	String chargeTpe=prepaidTxnChargesEntity.getCharge_Type(); 
		    	
		   	   String   serviceName=(String) entityManager.createQuery("select p.service_Name from PrepaidServiceMaster p where p.serviceId="+prepaidTxnChargesEntity.getSid()).getSingleResult();
		    
		   if(chargeTpe.equals("Charge")){
			prStoreEntity.setRate(String.valueOf(rate));
			prStoreEntity.setDaily_Consumption_Amt(consumAmt);
			prStoreEntity.setChargeName(chargeName);
			
		   }else{
			   
			  double  consumAmt1=(consumAmt*rate)/100;
			    prStoreEntity.setRate(String.valueOf(rate));
			    prStoreEntity.setDaily_Consumption_Amt(consumAmt1);
			    prStoreEntity.setChargeName(chargeName);
		   }
		   prStoreEntity.setArea(area);
		   prStoreEntity.setPersonId(personId);
		   prStoreEntity.setPropertyId(propId);
		   prStoreEntity.setCbName(cbName);
		   prStoreEntity.setServiceName(serviceName);
		   prStoreEntity.setDaily_Units_Consumed(units);
		   prStoreEntity.setMeterNo(objects[1]+"");
		   prStoreEntity.setReadingDate(readingDate);
		  
		   prepaidCalcuStoreService.save(prStoreEntity);
		   }
		 
	   }else if(cbName.equalsIgnoreCase("FLATRATE") || cbName.equalsIgnoreCase("LUMPSUM")){
		  
		   for (PrepaidTxnChargesEntity prepaidTxnChargesEntity : prEntities) {
			   PrepaidCalcuStoreEntity prStoreEntity=new PrepaidCalcuStoreEntity();
		    	double rate=prepaidTxnChargesEntity.getRate();
		    	String chargeName=prepaidTxnChargesEntity.getCharge_Name();
		    	String chargeTpe=prepaidTxnChargesEntity.getCharge_Type(); 
		    	
		   	   String   serviceName=(String) entityManager.createQuery("select p.service_Name from PrepaidServiceMaster p where p.serviceId="+prepaidTxnChargesEntity.getSid()).getSingleResult();
		    
		   if(chargeTpe.equals("Charge")){
			   
			prStoreEntity.setRate(String.valueOf(rate));
			prStoreEntity.setDaily_Consumption_Amt(rate);
			prStoreEntity.setChargeName(chargeName);
			
		   }/*else{
			   
			  double  consumAmt1=(consumAmt*rate)/100;
			    prStoreEntity.setRate(String.valueOf(rate));
			    prStoreEntity.setDaily_Consumption_Amt(consumAmt1);
			    prStoreEntity.setChargeName(chargeName);
		   }*/
		   prStoreEntity.setArea(area);
		   prStoreEntity.setPersonId(personId);
		   prStoreEntity.setPropertyId(propId);
		   prStoreEntity.setCbName(cbName);
		   prStoreEntity.setServiceName(serviceName);
		   prStoreEntity.setDaily_Units_Consumed(0.0);
		   prStoreEntity.setMeterNo(objects[1]+"");
		   prStoreEntity.setReadingDate(readingDate);
		
		   prepaidCalcuStoreService.save(prStoreEntity);
		   }
		 
	   }
		}
		}
		
		}else{
			count1--;
		out=response.getWriter();
		out.write("Consumption Data Not Available for meterNumber "+meterNumber+"\n");
		}
		
		}else{
			count1--;
			out=response.getWriter();
			out.write("Service Not Started for Property"+prepaidMeterService.getPropertyNo(propId)+"\n");
		}
	  
	   count1++;
	   }
	   out=response.getWriter();
		out.write( "Charges Calculation Done Successfully for "+count1+" Properties"+"\n");
	}
	
	}else{
		//erResponse.setStatus("STATUS");
		erResponse.setResult("Your Selected Service Status is Inactivated");
		return erResponse;
		/*out=response.getWriter();
		out.write("Your Selected Service Status is Inactivated");*/
	}
	  return null;
	}
	@RequestMapping(value="/serviceChargeCalcu/readUrl",method={RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody List<?> readData(){
		List<Map<String, Object>> resultList=new ArrayList<>();
		Map<String, Object> mapList=null;
		List<PrepaidCalcuStoreEntity> pEntities=prepaidCalcuStoreService.getAllStoreData();
		for (PrepaidCalcuStoreEntity prepaidCalcuStoreEntity : pEntities) {
			mapList=new HashMap<>();
			mapList.put("sccId",prepaidCalcuStoreEntity.getPcsId());
		
			if(prepaidCalcuStoreEntity.getPersonId()!=0){
			 List<?> peList=prepaidMeterService.getOwnerName(prepaidCalcuStoreEntity.getPersonId());
		   	   for(Iterator<?> iterator2=peList.iterator();iterator2.hasNext();){
		   	      final Object[] person=(Object[]) iterator2.next();
		       mapList.put("customer_Name", person[0]+""+person[1]);
		   	   }
			}
			if(prepaidCalcuStoreEntity.getPropertyId()!=0){
			mapList.put("property_No",prepaidMeterService.getPropertyNo(prepaidCalcuStoreEntity.getPropertyId()) );
			}
			mapList.put("area",prepaidCalcuStoreEntity.getArea());
			mapList.put("reading_Date",prepaidCalcuStoreEntity.getReadingDate());
			mapList.put("service_Name",prepaidCalcuStoreEntity.getServiceName() );
			mapList.put("charge_Name", prepaidCalcuStoreEntity.getChargeName());
			mapList.put("rate", prepaidCalcuStoreEntity.getRate());
			mapList.put("calculation_Basis",prepaidCalcuStoreEntity.getCbName() );
			mapList.put("daily_units_consumed", prepaidCalcuStoreEntity.getDaily_Units_Consumed());
			mapList.put("daily_Consumption_amt",prepaidCalcuStoreEntity.getDaily_Consumption_Amt() );
			mapList.put("daily_Rech_amt", prepaidCalcuStoreEntity.getDaily_Recharge_Amt());
			mapList.put("daily_balance", prepaidCalcuStoreEntity.getDaily_Balance());
			
			resultList.add(mapList);
		}
		
		return resultList;
	}
	
	/*public String exportConsumptionHtyToPdf(HttpServletRequest request,HttpServletResponse response) throws ParseException, DocumentException, MalformedURLException, IOException{
		logger.info("in side Export PDF");
		String fileName = ResourceBundle.getBundle("application").getString("bfm.exportCsvFilePath")+DateFormatUtils.format(new Date(), "MMM yyyy")+".pdf";
		logger.info("FromMonth " +request.getParameter("fromDate"));
		logger.info("ToMonth " +request.getParameter("consumerID"));
		logger.info("PropertyId " +request.getParameter("propertyId"));
		
		String fromDate= request.getParameter("fromDate");
		String consumerId=request.getParameter("consumerID");
		int propertyId=Integer.parseInt(request.getParameter("propertyId"));
		SimpleDateFormat formatter = new SimpleDateFormat("MMMM yyyy");
		//Date todate = formatter.parse(presentdate);
		Date fromdate=formatter.parse(fromDate);
		System.out.println("date from to date"+fromDate);
		List<Object[]> dailyData=new ArrayList<>();
		dailyData=prePaidInstantDataService.getConsumption(fromdate,fromdate,consumerId);
		System.out.println("list size++++++++++"+dailyData.size());
		 Document document = new Document(PageSize.A4, 20, 20, 50, 50);
	        ByteArrayOutputStream baos = new ByteArrayOutputStream();
	      PdfWriter writer=PdfWriter.getInstance(document, baos);
	      Rectangle rect = new Rectangle(30, 30, 300, 810);
	      writer.setBoxSize("art", rect);
	     
	      com.bcits.bfm.util.HeaderFooterPageEvent event=new com.bcits.bfm.util.HeaderFooterPageEvent();
	      writer.setPageEvent(event);
	        document.open(); 
	        Paragraph p = new Paragraph(" ");
	        p.setAlignment(Element.ALIGN_CENTER);
	        document.add(p);
	        Image image = Image.getInstance("C:/skyon.png");
	        image.scaleAbsolute(80,80);
	        image.setAbsolutePosition(10f, 765f);
	        image.setAlignment(image.LEFT);
	        document.add(image);
	        String mobileNo=null;
	        String emailID=null;
	       Person person=personService.find(prepaidMeterService.getPersonId(propertyId));
	        Set<Contact> contactsList = person.getContacts();
			for (Contact contact : contactsList) {
				if(contact.getContactPrimary().equals("Yes")){
					if(contact.getContactType().equals("Email")){
						contact.getContactContent();
						//payUForm.setCustomerEmail(contact.getContactContent());
					}else{
						mobileNo=contact.getContactContent();
						//payUForm.setCustomerMobile(contact.getContactContent());
					}
				}
			}
			 
	        Paragraph paragraph = new Paragraph(
	        		"Consumer Name: "+person.getFirstName()+person.getLastName(),new Font(Font.FontFamily.HELVETICA, 8));
	        Paragraph paragraph1= new Paragraph(
	        		"Property Number: "+prepaidMeterService.getPropertyNo(propertyId),new Font(Font.FontFamily.HELVETICA, 8));
	        Paragraph paragrap2 = new Paragraph(
	        		"Consumer ID      :  "+consumerId,new Font(Font.FontFamily.HELVETICA, 8));
	        Paragraph paragrap3 = new Paragraph(
	        		"Mobile Number   : "+mobileNo,new Font(Font.FontFamily.HELVETICA, 8));
	        document.add(paragraph);
	        document.add(paragraph1);
	        document.add(paragrap2);
	        document.add(paragrap3);
	        document.add(new Paragraph("Consumption Month : "+fromDate,new Font(Font.FontFamily.HELVETICA, 8)));
	        document.add(Chunk.SPACETABBING);
	        PdfPTable table = new PdfPTable(8);
	        Font font1 = new Font(Font.FontFamily.HELVETICA  , 9, Font.BOLD);
	        Font font3 = new Font(Font.FontFamily.HELVETICA, 8);
	        
	    	
	        
	        table.addCell(new Paragraph("Consumer ID",font1));
	        table.addCell(new Paragraph("Reading Date",font1));
	        table.addCell(new Paragraph("Balance",font1));
	        table.addCell(new Paragraph("Daily Consumed Amount",font1));
	        table.addCell(new Paragraph("Cum. kWh",font1));
	        table.addCell(new Paragraph("Cum.kWh(DG)",font1));
	        table.addCell(new Paragraph("Cum.FixChrg",font1));
	        table.addCell(new Paragraph("Cum.FixChrg(DG)",font1));
	      
	        int i=0;
			Date date=null;
			int month=0;
			int year=0;
			String postType="";
			String ledgerType="";
	        //XSSFCell cell = null;
	    	for (Object[] consumptionHtry :dailyData) {
	    		

	    		
	        PdfPCell cell1 = new PdfPCell(new Paragraph((String)consumptionHtry[1],font3));
	        PdfPCell cell2 = new PdfPCell(new Paragraph((String)consumptionHtry[2],font3));
	        PdfPCell cell3 = new PdfPCell(new Paragraph((String)consumptionHtry[3],font3));
	        PdfPCell cell4 = new PdfPCell(new Paragraph((String)consumptionHtry[4],font3));
	        PdfPCell cell5 = new PdfPCell(new Paragraph((String)consumptionHtry[8],font3));
	        PdfPCell cell6 = new PdfPCell(new Paragraph((String)consumptionHtry[9],font3));
	        PdfPCell cell7 = new PdfPCell(new Paragraph((String)consumptionHtry[5],font3));
	        PdfPCell cell8 = new PdfPCell(new Paragraph((String)consumptionHtry[6],font3));
	        table.addCell(cell1);
	        table.addCell(cell2);
	        table.addCell(cell3);
	        table.addCell(cell4);
	        table.addCell(cell5);
	        table.addCell(cell6);
	        table.addCell(cell7);
	        table.addCell(cell8);
	        
	        table.setWidthPercentage(100);
	        float[] columnWidths = {14f, 14f, 10f, 19f, 12f, 15f, 15f,18f};

	        table.setWidths(columnWidths);
	    		
			}
	        
	         document.add(table);
	        document.close();

	    	FileOutputStream fileOut = new FileOutputStream(fileName);    	
	    	baos.writeTo(fileOut);
	    	fileOut.flush();
	    	fileOut.close();
	        
	        ServletOutputStream servletOutputStream;

			servletOutputStream = response.getOutputStream();
			response.setContentType("application/pdf");
			response.setHeader("Content-Disposition", "inline;filename=\"Consumption History.pdf"+"\"");
			FileInputStream input = new FileInputStream(fileName);
			IOUtils.copy(input, servletOutputStream);
			//servletOutputStream.w
			servletOutputStream.flush();
			servletOutputStream.close();
		return null;
	}
	*/
	
	//@RequestMapping(value = "/bill/getbilltablePDF", method = {
		//	RequestMethod.POST, RequestMethod.GET })
/*	public void viewBillPDF(HttpServletResponse res, Locale locale) {
		logger.info("in side viewBillPDF");
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("previousBal",1000.00);
		param.put("rechargeAmt",500.00);
		param.put("closingBal",1500.00);
		param.put("consumptionAmt",200.00);
		param.put( "title",ResourceBundle.getBundle("utils").getString("report.title")); 
		param.put("companyAddress",ResourceBundle.getBundle("utils").getString("report.address"));
   	    param.put("point1",ResourceBundle.getBundle("utils").getString("report.point1"));
   	    param.put("point2",ResourceBundle.getBundle("utils").getString("report.point2"));
		param.put("point3.1", ResourceBundle.getBundle("utils").getString("report.point3.1"));
		param.put("point3.2",ResourceBundle.getBundle("utils").getString("report.point3.2"));
		param.put("point3.3", ResourceBundle.getBundle("utils").getString("report.point3.3"));
		param.put("point4",ResourceBundle.getBundle("utils").getString("report.point4"));
		param.put("note",ResourceBundle.getBundle("utils").getString("report.note")); 
		param.put("realPath", "reports/");
		param.put("address", "Bcits");
		param.put("city", "Bengalore");
		param.put("mainUnit",1.2);
		param.put("dgUnit", 1.00);
		param.put("elRate", 7.3);
		
		param.put("name", "vema");
		param.put("propertyNo", "SA-C-01-01");
		param.put("dgRate", 18.3);
		param.put("mainAmt",100.00);
		param.put("dgAmt", 50.00);
		param.put("totalAmt", 150.00);
	
		param.put("billingPeriod",DateFormatUtils.format((new Date()),"dd MMM. yyyy")	+ " To "+ DateFormatUtils.format((new Date()),"dd MMM. yyyy"));
		
		
		param.put("serviceName", "CAM");
		param.put("chargeName", "CAM Rate");
		param.put("rate",3.5);
		param.put("cbName", "AREA");
		param.put("calculatedAmt",100.00);
		param.put("totalAmt1",200.00);
		
		//param.put("grossconsumption", 300);
		param.put("area", 12);
		param.put("billNo", "BL1200");
		param.put("billDate",new Date() );
		param.put("mtrNo", "6000123");
		
		param.put("secondaryAddress", "Grand Arch ,Sector-58");
		JRBeanCollectionDataSource jre = new JRBeanCollectionDataSource(bliList);
		JREmptyDataSource jre = new JREmptyDataSource();
		JasperPrint jasperPrint;
		JasperReport report;
		try {
			logger.info("---------- filling the report -----------");
		
				jasperPrint = JasperFillManager.fillReport(this.getClass().getClassLoader().getResourceAsStream("reports/Bill.jasper"),param, jre);
			
			removeBlankPage(jasperPrint.getPages());
			byte[] bytes = JasperExportManager.exportReportToPdf(jasperPrint);
			InputStream myInputStream = new ByteArrayInputStream(bytes);
			Blob blob = Hibernate.createBlob(myInputStream);
			BillDocument billDocument = new BillDocument(electricityBillEntity, blob);
			billDocumentService.save(billDocument);
			try {
				logger.info("in side try block1");
				if (blob != null) {
					res.setHeader("Content-Disposition", "inline; filename="
							+"CAM" + "_"
							+"SA-C-01-01" + ".pdf");
					OutputStream out = res.getOutputStream();
					res.setContentType("application/pdf");
					IOUtils.copy(blob.getBinaryStream(), out);
					out.flush();
					out.close();
				} else {
					logger.info("::::::::::::: else block");
					OutputStream out = res.getOutputStream();
					IOUtils.write("File Not Found", out);
					out.flush();
					out.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (JRException e) {
			e.printStackTrace();
		} catch (IOException e) {
			logger.error("----------------- IOException");
		}
	}
	*/
	private void removeBlankPage(List<JRPrintPage> pages) {
		logger.info("in sdie removeblank");
		for (Iterator<JRPrintPage> i = pages.iterator(); i.hasNext();) {
			JRPrintPage page = i.next();
			if (page.getElements().size() == 4)
				i.remove();
		}
	}
	
	@RequestMapping(value = "/prepaidBill/getPropertyNo", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	List<?> getPropertyIds(HttpServletRequest req) {
		int blockId = Integer.parseInt(req.getParameter("blockId"));

		return prepaidMeterService.getAllProp(blockId);
	}
	
	@RequestMapping(value = "/prepaidDataprop/getPropertyNo", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	List<?> getPropertyIdsforBill(HttpServletRequest req) {
		int blockId = Integer.parseInt(req.getParameter("blockId"));

		return prepaidMeterService.getPropOnlyforChargesCalcu(blockId);
	}
	
	@RequestMapping(value = "/prepaidBillingModule/getPropertyNo", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	List<?> getPropertyIdsforMailBill(HttpServletRequest req) {
		int blockId = Integer.parseInt(req.getParameter("blockId"));

		return prepaidMeterService.getPropForMailBill(blockId);
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value="/prepaid/generateBillNew",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<?> generatePrepaidBill(HttpServletRequest req,HttpServletResponse res, Locale locale) throws Exception{
		int blocId=Integer.parseInt(req.getParameter("blocId"));
		String blockName=req.getParameter("blockName");
		Date presentdate = new SimpleDateFormat("MMMM yyyy").parse(req.getParameter("presentdate"));
		String propertyId =req.getParameter("propertyId");
		
		String tower =null;
		PrintWriter out;
		List<Map<String, Object>> reList=new ArrayList<>();
		Map<String, Object> mapList=null;
		logger.info("::::::blockId::"+null+":::::::::blockName:::"+blockName+":::::::::::presentdate::::"+presentdate+"::::::propertyId::::"+propertyId);
		           if(blockName!=null || blockName!=""){
					tower = blockName.substring(blockName.length() - 1);
					logger.info("tower ========= " + tower);
					String comma = ",";
					int count=0;
					String[] trancode = propertyId.split(comma);
					for (int i = 0; i < trancode.length; i++) {
						int propid = Integer.parseInt(trancode[i]);
					    long dataCount=prepaidBillService.getCount(propid, presentdate);
					    String propertyNo=prepaidMeterService.getPropertyNo(propid);
					    if(dataCount>0){
					    	out=res.getWriter();
							out.write("Bill Already Generated This Month for Property "+propertyNo+"/n ");
					    }else{
					    	Object[] prePaidMeters=prepaidMeterService.getserviceStartDate(propid);
						HashMap<String, Object> param = new HashMap<String, Object>();
						int  area=(int) entityManager.createQuery("select p.area from Property p where p.propertyId="+propid).getSingleResult();
						Person person=personService.find(prepaidMeterService.getPersonId(propid));
						Set<Address> address=person.getAddresses();
						String custaddress=null;
						for (Address address2 : address) {
							String d1=address2.getAddress1();
							String d2="";
							if(address2.getAddress2()!=null){
								 d2=address2.getAddress2();
							}
							custaddress=d1+","+d2;
						}
						String CustomerName=person.getFirstName()+""+person.getLastName();
						String meterNo=prepaidMeterService.getMtrNo(propid);
						String billNo=genrateAdjustmentNumber();
						
						double allSum=0.0;
						List<?> resultList=prepaidCalcuStoreService.getSumofAllCharges(presentdate,propid);
						if(!(resultList.isEmpty())){
						for(Iterator<?> iterator=resultList.iterator();iterator.hasNext();){
						 final Object[] values=(Object[]) iterator.next();
						 //System.err.println("*********************START********");
						// Double.parseDouble(values[8]+"")+Double.parseDouble(values[8])
						 double dgAmt=0.0;
						 double mainAMT=0.0;
						 if(values[3].equals("DG")){
							 param.put("dgUnit", Double.parseDouble(values[7]+""));
							 param.put("dgRate", Double.parseDouble(values[5]+""));
							 param.put("dgAmt", Double.parseDouble(values[8]+""));
							 if(values[8]!=null){
							 dgAmt=Double.parseDouble(values[8]+"");
							 }
							
						 }else if(values[3].equals("Electricity")){
							 param.put("mainUnit",Double.parseDouble(values[7]+""));
							 param.put("elRate", Double.parseDouble(values[5]+""));
							 param.put("mainAmt",Double.parseDouble(values[8]+""));
							 if(values[8]!=null){
								 mainAMT=Double.parseDouble(values[8]+"");
								 }
							
						 }else {
							 if(values[4].equals("Rate")){
								    param.put("serviceName", values[3]+"");
									param.put("chargeName",values[4]+"" );
									param.put("rate",Double.parseDouble(values[5]+""));
									param.put("cbName", values[6]+""+"(PSF)");
									//param.put("calculatedAmt",Double.parseDouble(values[8]+""));
									param.put("totalAmt1",Double.parseDouble(values[8]+""));
									
							 }else if(values[4].equals("Service Tax")){
								    param.put("serviceName1", values[3]+"");
									param.put("chargeName1",values[4]+"" );
									param.put("rate1",Double.parseDouble(values[5]+""));
									param.put("cbName1", "%");
									//param.put("calculatedAmt1",Double.parseDouble(values[8]+""));
									param.put("totalAmt2",Double.parseDouble(values[8]+""));
									
									 
							 }else if(values[4].equals("Swach Bharat Cess")){
								    param.put("serviceName2", values[3]+"");
									param.put("chargeName2",values[4]+"" );
									param.put("rate2",Double.parseDouble(values[5]+""));
									param.put("cbName2", "%");
									//param.put("calculatedAmt2",Double.parseDouble(values[8]+""));
									param.put("totalAmt3",Double.parseDouble(values[8]+""));
								
							 }else if(values[4].equals("Krishi Kalyan Cess")){
								    param.put("serviceName3", values[3]+"");
									param.put("chargeName3",values[4]+"" );
									param.put("rate3",Double.parseDouble(values[5]+""));
									param.put("cbName3", "%");
									//param.put("calculatedAmt3",Double.parseDouble(values[8]+""));
									param.put("totalAmt4",Double.parseDouble(values[8]+""));
									
							 }
							 allSum+=Double.parseDouble(values[8]+"");
						//	System.err.println(camamt1+camamt2+camamt3+camamt4);
						 }
						   
						 param.put("totalAmt",dgAmt+mainAMT);
						
						}
						//System.out.println("listSize "+list1.size()+"**********"+allSum);
						param.put("grossConsumptionAmt", Math.round(prepaidCalcuStoreService.getSumofAmt(presentdate, propid)));
						param.put( "title",ResourceBundle.getBundle("utils").getString("report.title")); 
						param.put("companyAddress",ResourceBundle.getBundle("utils").getString("report.address"));
				   	    param.put("point1",ResourceBundle.getBundle("utils").getString("report.point1"));
				   	    param.put("point2",ResourceBundle.getBundle("utils").getString("report.point2"));
						param.put("point3.1", ResourceBundle.getBundle("utils").getString("report.point3.1"));
						param.put("point3.2",ResourceBundle.getBundle("utils").getString("report.point3.2"));
						param.put("point3.3", ResourceBundle.getBundle("utils").getString("report.point3.3"));
						param.put("point4",ResourceBundle.getBundle("utils").getString("report.point4"));
						param.put("point5",ResourceBundle.getBundle("utils").getString("report.point5"));
						param.put("note",ResourceBundle.getBundle("utils").getString("report.note")); 
						param.put("realPath", "reports/");
						param.put("name", CustomerName);
						param.put("propertyNo",propertyNo);
						param.put("address",propertyNo +","+blockName);
						param.put("city", "Gurugram");
						param.put("secondaryAddress",custaddress);
						param.put("area", area);
						param.put("sumAmt", Math.round(allSum));
						param.put("billNo", billNo);
						param.put("billDate",new SimpleDateFormat("MMM yyyy").format(presentdate));
						/*List<Object[]> list=prePaidInstantDataService.getMinMaxDate(presentdate, meterNo);
						Date fDate=null;
						Date tDate=null;
						if(!(list.isEmpty())){
						for (Object[] objects : list) {
							fDate=new SimpleDateFormat("dd/MM/yyyy").parse(objects[0]+"");
							tDate=new SimpleDateFormat("dd/MM/yyyy").parse(objects[1]+"");
						}
						}*/
						
						param.put("mtrNo", meterNo);
						
						List<Object[]> objects=prepaidCalcuStoreService.getMinMaxDate(presentdate,meterNo,propid);
						Date minDate=null;
						Date maxDate=null;
						if(!(objects.isEmpty())){
							for (Object[] objects2 : objects) {
								minDate=new SimpleDateFormat("yyyy-MM-dd").parse(objects2[0]+"");
								maxDate=new SimpleDateFormat("yyyy-MM-dd").parse(objects2[1]+"");
								System.out.println("maxDate "+maxDate);
							}
							
						}
						param.put("billingPeriod",DateFormatUtils.format((minDate),"dd MMM. yyyy")	+ " To "+ DateFormatUtils.format((maxDate),"dd MMM. yyyy"));
						double preBal=prepaidDailyConsumService.getMinBalance(minDate, meterNo);
						//String preBal=prePaidInstantDataService.getMaxMinBalance(presentdate, meterNo);
						System.err.println("prepBal "+preBal);
						double prevoiusBal=0.0;
						double closingBal=0.0;
						long billcount=prepaidBillService.getBillCount(propid);
						if(billcount>0){
					    if(preBal!=0.0){
					    		  param.put("previousBal",preBal);
					    		  prevoiusBal=preBal;
						
							 }else{
								Object[] array=prepaidDailyConsumService.getcurrentBalence(minDate, meterNo);
								double balance=(double) array[0];
								double ebunit=(double) array[1];
								double dgunit=(double) array[2];
								 param.put("previousBal",balance+(ebunit*18.5)+(dgunit*18.3));
								 prevoiusBal=balance+(ebunit*18.5)+(dgunit*18.3);
							 }
						}else{
							if(preBal!=0.0){
					    		  param.put("previousBal",preBal);
					    		  prevoiusBal=preBal;
						
							 }else{
								 param.put("previousBal",Double.parseDouble(prePaidMeters[1]+""));
								 prevoiusBal=Double.parseDouble(prePaidMeters[1]+"");
							 }
						}
					   double clBal=prepaidDailyConsumService.getMaxBalance(maxDate, meterNo);
					    if(clBal!=0.0){
					    
					    		 param.put("closingBal",clBal);
					    		 closingBal=clBal;
							
					   
					    }
					    long rechargeamt=prepaidDailyConsumService.getRechargeAmtDuringPeriod(presentdate, meterNo);
					      
					    //double rechargeAMT=String(rechargeamt);
						param.put("rechargeAmt",String.valueOf(rechargeamt));
					     
						Integer numToWord= (int) Math.round(prepaidCalcuStoreService.getSumofAmt(presentdate, propid));
						String amountInWords = NumberToWord.convertNumberToWords(numToWord.intValue());
						param.put("amountInWords", amountInWords + " Only");
						
					    long bal=Math.round(prevoiusBal+rechargeamt)-Math.round(closingBal);
						param.put("consumptionAmt",bal);
						
						
						PrepaidBillDetails billDetails=new PrepaidBillDetails();
						billDetails.setBill_Amt(Math.round(prepaidCalcuStoreService.getSumofAmt(presentdate, propid)));
						billDetails.setBill_Month(presentdate);
						billDetails.setBillNo(billNo);
						billDetails.setPropertyId(propid);
						
						billDetails.setPreviousBal(prevoiusBal);
						billDetails.setClosingBal(closingBal);
						
						prepaidBillService.save(billDetails);
						
						//JRBeanCollectionDataSource jre = new JRBeanCollectionDataSource(bliList);
						JREmptyDataSource jre = new JREmptyDataSource();
						JasperPrint jasperPrint;
						JasperReport report;
						try {
							logger.info("---------- filling the report -----------");
						
								jasperPrint = JasperFillManager.fillReport(this.getClass().getClassLoader().getResourceAsStream("reports/Bill.jasper"),param, jre);
							
							removeBlankPage(jasperPrint.getPages());
							byte[] bytes = JasperExportManager.exportReportToPdf(jasperPrint);
							InputStream myInputStream = new ByteArrayInputStream(bytes);
							Blob blob = Hibernate.createBlob(myInputStream);
							PrepaidBillDocument billDocument = new PrepaidBillDocument(propid, presentdate, billNo, blob);
							prepaidBillDocService.save(billDocument);
							
						} catch (JRException e) {
							e.printStackTrace();
						} catch (IOException e) {
							logger.error("----------------- IOException");
						}
						count++;
						}else{
							out=res.getWriter();
							out.write("No Data Found for Property "+propertyNo+"/n ");
						}
					    }
					}
					if(count!=0){
					out=res.getWriter();
					out.write(count+"Bill generated Succefully");
					}
		           }
	return null; 
	}
	
	 public String genrateAdjustmentNumber() throws Exception {  
			/*Random generator = new Random();  
			generator.setSeed(System.currentTimeMillis());  
			   
			int num = generator.nextInt(99999) + 99999;  
			if (num < 100000 || num > 999999) {  
			num = generator.nextInt(99999) + 99999;  
			if (num < 100000 || num > 999999) {  
			throw new Exception("Unable to generate PIN at this time..");  
			}  
			}  
			return "AD"+num;*/ 
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			String year = sdf.format(new Date());
			int nextSeqVal = adjustmentService.autoGeneratedAdjustmentNumber();	 
			
			return "BILL"+nextSeqVal;		   
		}
	 
	 @RequestMapping(value="/prepaidBillGen")
		public String index1(){
		 logger.info("in side index2");
			return "prepaidBill";
		} 
	 
	 @RequestMapping(value="/prpaidBill/prePaidELBillReadUrl",method={RequestMethod.GET,RequestMethod.POST})
	 public @ResponseBody List<?> readAllData(){
		 List<PrepaidBillDetails> details=prepaidBillService.getData();
		 List<Map<String, Object>> resultList=new ArrayList<>();
			Map<String, Object> maplist=null;
			if(details!=null){
			for(PrepaidBillDetails prepaidBillDetails:details){
				maplist=new HashMap<>();
				maplist.put("preBillId", prepaidBillDetails.getPreBillId());
				maplist.put("mtrNo", prepaidMeterService.getMtrNo(prepaidBillDetails.getPropertyId()));
				Person person=personService.find(prepaidMeterService.getPersonId(prepaidBillDetails.getPropertyId()));
				String CustomerName=person.getFirstName()+""+person.getLastName();
				maplist.put("personName", CustomerName);
				maplist.put("propertyNo", prepaidMeterService.getPropertyNo(prepaidBillDetails.getPropertyId()));
				String date=new SimpleDateFormat("MMM yyyy").format(prepaidBillDetails.getBill_Month());
				maplist.put("billMonth", date);
				maplist.put("netAmount", prepaidBillDetails.getBill_Amt());
				maplist.put("billNo", prepaidBillDetails.getBillNo());
				maplist.put("previousBal", prepaidBillDetails.getPreviousBal());
				maplist.put("closingBal", prepaidBillDetails.getClosingBal());
				maplist.put("mailStatus", prepaidBillDetails.getMailStatus());
				resultList.add(maplist);
			}
			}
			return resultList;
	 }
	 
	 @RequestMapping(value="/prpaidBill/prePaiddestroyUrl",method={RequestMethod.GET,RequestMethod.POST})
	 public @ResponseBody Object deleteBillData(HttpServletRequest request){
		 logger.info("in side Bill Delete Methode "+request.getParameter("preBillId"));
		 int preBillId=Integer.parseInt(request.getParameter("preBillId"));
		 PrepaidBillDetails billDetails=prepaidBillService.find(preBillId);
		 prepaidBillService.delete(preBillId);
		 return billDetails;
	 }
	 
	 @RequestMapping(value = "/prepaidBill/getbilltablePDF/{preBillId}", method = {
				RequestMethod.POST, RequestMethod.GET })
		public void viewBillPDF(@PathVariable int preBillId,
				HttpServletResponse res, Locale locale) {
			PrepaidBillDetails prepaidBillDetails = prepaidBillService.find(preBillId);
			//getBillDoc(electricityBillEntity.getElBillId(), locale);
			Blob blob = prepaidBillDocService.getBlog(prepaidBillDetails.getBillNo());
			Property property = propertyService.find(prepaidBillDetails.getPropertyId());
			try {
				if (blob != null) {
					res.setHeader("Content-Disposition", "inline; filename="
							+"PrepaidBill"+ "_"
							+ property.getProperty_No() + ".pdf");
					OutputStream out = res.getOutputStream();
					res.setContentType("application/pdf");
					IOUtils.copy(blob.getBinaryStream(), out);
					out.flush();
					out.close();
				} else {
					logger.info("::::::::::::: else block");
					OutputStream out = res.getOutputStream();
					IOUtils.write("File Not Found", out);
					out.flush();
					out.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
}


