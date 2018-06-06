package com.bcits.bfm.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bcits.bfm.model.Account;
import com.bcits.bfm.model.OldMeterHistoryEntity;
import com.bcits.bfm.model.OwnerProperty;
import com.bcits.bfm.model.PrePaidMeters;
import com.bcits.bfm.model.TenantProperty;
import com.bcits.bfm.service.PrePaidMeterService;
import com.bcits.bfm.service.PrepaidMeterHistoryService;
import com.bcits.bfm.service.accountsManagement.AccountService;
import com.bcits.bfm.service.customerOccupancyManagement.PersonService;
import com.bcits.bfm.service.helpDeskManagement.OpenNewTicketService;
import com.bcits.bfm.util.JsonResponse;
import com.bcits.bfm.view.BreadCrumbTreeService;

//***************vema************
@Controller
public class PrePaidMasterController {
	
	final Logger logger=LoggerFactory.getLogger(PrePaidMasterController.class);
	
	@Autowired
	private OpenNewTicketService openNewTicketService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private PrePaidMeterService prepaidMeterService;
	
	
	@Autowired
	private PrepaidMeterHistoryService prepaidMeterHistoryService;
	/*
	@Autowired
    private	PrePaidGenusBillDataservice  prePaidHistoricalData;
	
	@Autowired
	private PrePaidInstantDataService prePaidInstantDataService;
	
	@Autowired
	private PrepaidRechargeService prepaidRechargeService;*/
	
	@Autowired
	private PersonService personService;
	
	@Autowired
	private BreadCrumbTreeService breadCrumbService;
	  
	
	@RequestMapping(value="/meters")
	public String index(@ModelAttribute("paidMeters") PrePaidMeters paidMeters,HttpServletRequest request,Model model){
		logger.info("in side index===============");
		model.addAttribute("ViewName", "Meter Assignment");
		breadCrumbService.addNode("nodeID", 0, request);
		breadCrumbService.addNode("Prepaid Billing", 1, request);
		breadCrumbService.addNode("Manage Meter Assignment", 2, request);
		return "prePaidMeterGeneration";
	}
	
	@RequestMapping(value="/meterGeneration/accountNumber" ,method=RequestMethod.GET)
	public List<?> getAccountInfo(HttpServletResponse response,HttpServletRequest request) throws IOException, JSONException{
		int personId=Integer.parseInt(request.getParameter("personId"));
		int propertyId = Integer.parseInt(request.getParameter("propertyId"));
		logger.info("Person Id  is.."+personId);
		List<?> list= accountService.getAccountNumber(personId,propertyId);
		PrintWriter out=null;
		JSONArray array=new JSONArray(list);
		response.setContentType("application/json");
		logger.info("Converting list type  to JSON Array type"+array);
		out=response.getWriter();
		out.print(array);
	    return null;
	}
	

	@RequestMapping(value="/meterHistory")
	public String indexmeterHtry(){
		return "oldMeterHistory";
	}
	
	@RequestMapping(value="/oldMeterHistoryDetails/readUrl",method={RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody List<?> readMeterHistory(){
		return prepaidMeterHistoryService.findmeterHtryDetails();
	}
	
	
	/*-------------------------Meter History---------------------------------------*/
	
	@RequestMapping(value="/saveMeterHistoryDetails",method={RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody String savemeterHistory(HttpServletRequest request) throws ParseException{
		logger.info("in side saveMeterHistory Methode");
		
		//List<OldMeterHistoryEntity> uniqueCaNo = prepaidMeterHistoryService.testUniqueCaNo();
		//if(uniqueCaNo.isEmpty()){
		String ca_No=request.getParameter("ca_no");
		OldMeterHistoryEntity oldMeter=	prepaidMeterHistoryService.getSingleData(ca_No);
		System.out.println("1");
	if(oldMeter==null){
	
		System.out.println("2");
	  OldMeterHistoryEntity meterHistoryEntity=new OldMeterHistoryEntity();
	  meterHistoryEntity.setPropertyNo(request.getParameter("propertyName"));
	  meterHistoryEntity.setPersonName(request.getParameter("personName"));
	  meterHistoryEntity.setMeterNumber(request.getParameter("meterNumber"));
	  meterHistoryEntity.setBalance(Double.parseDouble(request.getParameter("balance")));
	  meterHistoryEntity.setServiceStartDate(new SimpleDateFormat("EEE MMM dd yyyy HH:mm:ss 'GMT'Z", Locale.ENGLISH).parse(request.getParameter("serviceStartDate")));
	  meterHistoryEntity.setServiceEndDate(new Date());
	  meterHistoryEntity.setInitailReading(Double.parseDouble(request.getParameter("ebReading")));
	  meterHistoryEntity.setDgReading(Double.parseDouble(request.getParameter("dgReading")));
	  meterHistoryEntity.setCa_no(request.getParameter("ca_no"));
	  System.out.println("save");
	    prepaidMeterHistoryService.save(meterHistoryEntity);
	    System.out.println("save done");
			
	
	    return "Meter Data Saved Successfully. Now You Can Assign New Meter Number";
		}
		
		else{
			System.out.println("3");
			return "Meter Data Already Exist";
		}
		
}

	
	
    @RequestMapping(value="/meterGeneration/meterNumberAvailability/{prePaidId}" ,method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<String> checkMeterNum(HttpServletResponse response,HttpServletRequest request,@PathVariable int prePaidId) throws IOException, JSONException{
		logger.info("checkMeterNum *** "+prePaidId);
	    return prepaidMeterService.getMeterNumber(prePaidId);
	}
	
	
	@RequestMapping(value="/meterGeneration/meterNumberAvailability123/{meterNumber}" ,method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody String checkMeter(@PathVariable String meterNumber,HttpServletResponse response,HttpServletRequest request) throws IOException, JSONException{
		
		List<String> meterId=prepaidMeterService.getMeterNumbers();
		 for (Iterator<?> iterator=meterId.iterator();iterator.hasNext();) {
			 String value= (String) iterator.next();
		   if((value.toString()).equalsIgnoreCase(meterNumber)){
			  return "Meter Already Assigned";
		   }
		
		 }
	    return null;
	}
	@RequestMapping(value="/meterGenerationCreate", method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Object meterSave(@ModelAttribute("paidMeters") PrePaidMeters paidMeters,HttpServletRequest request,HttpServletResponse response,Model model){
		logger.info("in side meter save methode");
		
	System.out.println("Inside Meter Assignment Save Controller.........");
	
	     PrePaidMeters meters=new PrePaidMeters();
	     String obj=null;
		System.out.println("PERSON ID ="+request.getParameter("personId"));
		String readingDate=request.getParameter("readingDate");
		DateFormat dateFormat=new SimpleDateFormat("dd/MM/yyyy");
		Date serviceStartDate=null;
		try {
			serviceStartDate=dateFormat.parse(readingDate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		long count=prepaidMeterService.getmetersDetails(Integer.parseInt(request.getParameter("personId")),Integer.parseInt(request.getParameter("propertyId")));
		if(count==0){
		//List<?> uList=accountService.testUniqueAccount(Integer.parseInt(request.getParameter("personId")),Integer.parseInt(request.getParameter("propertyId")));
		Account account=new Account();
		List<Account> uniqueAccount = accountService.testUniqueAccount1(Integer.parseInt(request.getParameter("personId")),Integer.parseInt(request.getParameter("propertyId")));
		if(uniqueAccount.isEmpty()){
			try {
				obj = genrateAccountNumbers();
				logger.info("Generated account number is!!");
				System.out.println(obj);
				account.setAccountNo(obj);
				account.setPersonId(Integer.parseInt(request.getParameter("personId")));
				account.setPropertyId(Integer.parseInt(request.getParameter("propertyId")));
				
				account.setAccountStatus("Active");
				account.setAccountType("Services");
				accountService.save(account);
			}
			catch (Exception e) {
				// TODO Auto-generated catch block
				   e.printStackTrace();
			    }

			    meters.setPersonId(Integer.parseInt(request.getParameter("personId")));
			    meters.setPropertyId(Integer.parseInt(request.getParameter("propertyId")));
			    meters.setMeterNumber(request.getParameter("meterNumber"));
			    meters.setInitailReading(Double.parseDouble(request.getParameter("initailReading")));
			    meters.setDgReading(Double.parseDouble(request.getParameter("dgReading")));
			    meters.setCa_no(request.getParameter("ca_Number"));
			    meters.setServiceStartDate(serviceStartDate);
			    meters.setPreviousBalance(Double.parseDouble(request.getParameter("balance")));
			     return  prepaidMeterService.save(meters);
		}
		else{
			System.out.println("In else Part prepaid_Meters============");
			meters.setPersonId(Integer.parseInt(request.getParameter("personId")));
		    meters.setPropertyId(Integer.parseInt(request.getParameter("propertyId")));
		    meters.setMeterNumber(request.getParameter("meterNumber"));
		    meters.setInitailReading(Double.parseDouble(request.getParameter("initailReading")));
		    meters.setDgReading(Double.parseDouble(request.getParameter("dgReading")));
		    meters.setCa_no(request.getParameter("ca_Number"));
		    meters.setServiceStartDate(serviceStartDate);
		    meters.setPreviousBalance(Double.parseDouble(request.getParameter("balance")));
		     return  prepaidMeterService.save(meters);
		}
		
        }else{
	  return "Already Meter Assigned for these Property";
}

}

    
	@RequestMapping(value="/prePaidMeterGeneration/readUrl", method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<?> meterRead(){
		logger.info("in side meterRead methode");
		List<?> resultList=prepaidMeterService.FindAll();
		final List<Map<String, Object>> result=new ArrayList<>();
		Map<String, Object> map=null;
		for(Iterator<?> iterator=resultList.iterator();iterator.hasNext();){
	       final Object[] values=(Object[]) iterator.next();
	       map=new HashMap<>();
	       map.put("prePaidId", values[0]);
	       try{
	       if(values[2]!=null){
	    	  int  accid=Integer.parseInt(values[2].toString());;
	       map.put("blocksName", prepaidMeterService.getBlockName(accid));
	       }
	       }catch(Exception e){e.printStackTrace();}
	       
	       try{
	       if(values[2]!=null){
	    	   int  propertyId=Integer.parseInt(values[2].toString());
	       map.put("propertyName", prepaidMeterService.getPropertyNo(propertyId));
	       }
	       }catch(Exception e){e.printStackTrace();}
	       
	         if(values[1]!=null){
	        int personId=Integer.parseInt(values[1].toString());
	   	   List<?> peList=prepaidMeterService.getOwnerName(personId);
	   	   for(Iterator<?> iterator2=peList.iterator();iterator2.hasNext();){
	   	      final Object[] person=(Object[]) iterator2.next();
	       map.put("personName", person[0]+""+person[1]);
	   	   }
	     	}
		
	       
	       map.put("meterNumber", values[3]);
	       map.put("ca_no", values[4]);
	       map.put("initialBalnce", values[5]);
	       if(values[6]!=null){
	    	   DateFormat dateFormat=new SimpleDateFormat("MM/dd/yyyy");
	       map.put("readingDate", dateFormat.format((Date)values[6]));
	       }
	       
	       if(values[7]!=null){
	       map.put("initailReading",values[7]);
	       }
	       
	       if(values[8]!=null){
		       map.put("dgReading",values[8]);
		       }
	       
	       result.add(map);
	       
		}
		return result;
	}
	
	@RequestMapping(value="/prePaidMeterGeneration/updateUrl", method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody PrePaidMeters meterUpdate(HttpServletRequest request,Model model){
		logger.info("in side meter Update methode" );
		String readingDate=request.getParameter("readingDate");
	    //System.out.println("reading Date "+readingDate);
	    System.out.println("initial Reading "+request.getParameter("initialReading"));
		DateFormat dateFormat=new SimpleDateFormat("EEE MMM dd yyyy",Locale.US);
		Date serviceStartDate=null;
		try {
			serviceStartDate=dateFormat.parse(readingDate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		int prePaidId=Integer.parseInt(request.getParameter("prePaidId"));
		System.out.println(prePaidId);
		
	    System.out.println(request.getParameter("meterNumber"));
	  
	    PrePaidMeters meters=prepaidMeterService.find(prePaidId);
		meters.setMeterNumber(request.getParameter("meterNumber"));
		
		meters.setCa_no(request.getParameter("ca_no"));
		System.out.println("initailReading==========="+request.getParameter("initailReading"));
		System.out.println("dgReading================"+request.getParameter("dgReading"));
		
		meters.setInitailReading(Double.parseDouble(request.getParameter("initailReading")));
		meters.setDgReading(Double.parseDouble(request.getParameter("dgReading")));
		
	    meters.setServiceStartDate(serviceStartDate);
	    meters.setPreviousBalance(Double.parseDouble(request.getParameter("initialBalnce")));
		return prepaidMeterService.update(meters);
	 
	}
	
	
	
	
	public String genrateAccountNumbers() throws Exception {  
		/*Random generator = new Random();  
		generator.setSeed(System.currentTimeMillis());  
		   
		int num = generator.nextInt(99999) + 99999;  
		if (num < 100000 || num > 999999) {  
		num = generator.nextInt(99999) + 99999;  
		if (num < 100000 || num > 999999) {  
		throw new Exception("Unable to generate PIN at this time..");  
		}  
		}  
		return "AC"+num; */ 
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String year = sdf.format(new Date());
		int nextSeqVal = accountService.autoGeneratedAccountNumber();
		
		return "AC"+year+""+nextSeqVal; 		
		}
	
	@RequestMapping(value = "/prepaidMeters/getPersonListBasedOnPropertyNumbers", method = RequestMethod.GET)
	public @ResponseBody List<?> readPersons() {
		logger.info("In get the all owners and tenants method");
		List<OwnerProperty> propertyPersonOwnerList = openNewTicketService.findAllPropertyPersonOwnerList();
		List<TenantProperty> propertyPersonTenantList = openNewTicketService.findAllPropertyPersonTenantList();
		
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> propertyOwnerMap = null;
		Map<String, Object> propertyTenantMap = null;
		for (Iterator<?> iterator = propertyPersonOwnerList.iterator(); iterator.hasNext();) {
			
			final Object[] values = (Object[]) iterator.next();
			propertyOwnerMap = new HashMap<String, Object>();
			
			String str="";
			if((String)values[2]!=null){
				str=(String)values[2];
			}
							
			propertyOwnerMap.put("personName", (String)values[1]+" "+str);	
			propertyOwnerMap.put("propertyId",(Integer)values[0]);
			propertyOwnerMap.put("personId", (Integer)values[3]);	
			propertyOwnerMap.put("personType",(String)values[4]);
			propertyOwnerMap.put("personStyle", (String)values[5]);
		
		    result.add(propertyOwnerMap);				
		}
       for (Iterator<?> iterator = propertyPersonTenantList.iterator(); iterator.hasNext();) {				
			final Object[] values = (Object[]) iterator.next();
			propertyTenantMap = new HashMap<String, Object>();
			
			String str="";
			if((String)values[2]!=null){
				str=(String)values[2];
			}
							
			propertyTenantMap.put("personName", (String)values[1]+" "+str);	
			propertyTenantMap.put("propertyId",(Integer)values[0]);
			propertyTenantMap.put("personId", (Integer)values[3]);	
			propertyTenantMap.put("personType",(String)values[4]);
			propertyTenantMap.put("personStyle", (String)values[5]);	
		
		result.add(propertyTenantMap);
	    }
       return result;
	} 
	
	@RequestMapping(value = "/ConsumerTemplate/ConsumerTemplatesDetailsExport", method = {RequestMethod.POST,RequestMethod.GET})
	   public String exportCVSVisitorFile(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException{
			
			
		 logger.info("hi_________________________----------------");
	 
			String fileName = ResourceBundle.getBundle("application").getString("bfm.exportCsvFilePath")+DateFormatUtils.format(new Date(), "MMM yyyy")+".xlsx";
	        
	       
			List<?> queryTemplateEntities = prepaidMeterService.FindAll();;
		
	               
	        String sheetName = "Templates";//name of sheet

	    	XSSFWorkbook wb = new XSSFWorkbook();
	    	XSSFSheet sheet = wb.createSheet(sheetName) ;
	    	
	    	XSSFRow header = sheet.createRow(0);    	
	    	
	    	XSSFCellStyle style = wb.createCellStyle();
	    	style.setWrapText(true);
	    	XSSFFont font = wb.createFont();
	    	font.setFontName(HSSFFont.FONT_ARIAL);
	    	font.setFontHeightInPoints((short)10);
	    	font.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);
	    	style.setFont(font);
	    	
	    	header.createCell(0).setCellValue("CA Number");
	        header.createCell(1).setCellValue("Tower Name");
	        header.createCell(2).setCellValue("Property Number");
	        header.createCell(3).setCellValue("Person Name");
	        header.createCell(4).setCellValue("Meter Number");
	     
	       
	       
	        for(int j = 0; j<=4; j++){
	    		header.getCell(j).setCellStyle(style);
	            sheet.setColumnWidth(j, 8000); 
	            sheet.setAutoFilter(CellRangeAddress.valueOf("A1:Q200"));
	        }
	        
	        int count = 1;
	        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm ");
	        for(Iterator<?> iterator=queryTemplateEntities.iterator();iterator.hasNext();){
	 	       final Object[] values=(Object[]) iterator.next();
	    		
	    		XSSFRow row = sheet.createRow(count);
	    		if(values[4]!=null){
	    		row.createCell(0).setCellValue((String)values[4]);
	    		}
	    		 if(values[2]!=null){
	    			 int  blockid=Integer.parseInt(values[2].toString());
	    		row.createCell(1).setCellValue( prepaidMeterService.getBlockName(blockid));
	    		 }
	    		  if(values[2]!=null){
	    			  int  propertyId=Integer.parseInt(values[2].toString());
	    		row.createCell(2).setCellValue( prepaidMeterService.getPropertyNo(propertyId));
	    		
	    		  }
	    		 
	    		  if(values[1]!=null){
	    		        int personId=Integer.parseInt(values[1].toString());
	    		   	   List<?> peList=prepaidMeterService.getOwnerName(personId);
	    		   	   for(Iterator<?> iterator2=peList.iterator();iterator2.hasNext();){
	    		   	      final Object[] person=(Object[]) iterator2.next();
	    	    row.createCell(3).setCellValue(person[0]+""+person[1]);
	    		  }
	    		  }
	    		row.createCell(4).setCellValue((String)values[3]);
	    	
	    		count ++;
			}
	    	
	    	FileOutputStream fileOut = new FileOutputStream(fileName);    	
	    	wb.write(fileOut);
	    	fileOut.flush();
	    	fileOut.close();
	        
	        ServletOutputStream servletOutputStream;

			servletOutputStream = response.getOutputStream();
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "inline;filename=\"ConsumerMeterDetails.xlsx"+"\"");
			FileInputStream input = new FileInputStream(fileName);
			IOUtils.copy(input, servletOutputStream);
			//servletOutputStream.w
			servletOutputStream.flush();
			servletOutputStream.close();
			
			return null;
		}

	@RequestMapping(value="/meterGeneration/checkCANumbAvailability/{ca_Number}",method={RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody int checkCAnumberAvailability(HttpServletRequest request,HttpServletResponse response,@PathVariable String ca_Number){
		
		logger.info("in side checkCAnumberAvailability methode   "+ca_Number);
		//JsonResponse jsonResponse=new JsonResponse();
		long count=prepaidMeterService.getCANumber(ca_Number);
		if(count>0){
			return 0;
		}else{
			return 1;
		}
		
	}
	
	@RequestMapping(value="/meterGeneration/checkCANumbers/{prePaidId}",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<String> getCaNumers(@PathVariable int prePaidId){
		return prepaidMeterService.getAllCaNumbers(prePaidId);
	}
}
