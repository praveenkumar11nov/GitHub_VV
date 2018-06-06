package com.bcits.bfm.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRPrintPage;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.hibernate.Hibernate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bcits.bfm.model.Contact;
import com.bcits.bfm.model.Person;
import com.bcits.bfm.model.PrepaidBillDocument;
import com.bcits.bfm.model.PrepaidRechargeEntity;
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

@Controller
public class AccountStatement 
{
	@PersistenceContext(unitName="bfm")
	protected EntityManager entityManager;
	
	@RequestMapping(value="/accountStmtPage")
	public String accountMethod()
	{
		return "accountStatement";
	}
	
	@RequestMapping(value="/accountStatementDetail")
	public @ResponseBody List<Map<String,Object>> getAccountStatement() 
	{
		List<?> list1 =entityManager.createNativeQuery("SELECT DISTINCT(p.METER_NUMBER) FROM PREPAID_METERS p").getResultList();
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> wizardMap = null;
		int noOfMeters=0;
		
		for(int i=0;i<list1.size();i++)
		{
			//System.out.println("For meter Number="+list1.get(i)+",Account statement is----->");
			String query2=	
					"SELECT A.initial_Reading_EB,E.final_Reading_EB,(E.final_Reading_EB-A.initial_Reading_EB)AS consumption_Unit_EB, " +
							"A.initial_Reading_DG,E.final_Reading_DG,(E.final_Reading_DG-A.initial_Reading_DG)AS consumption_Unit_DG, " +
							"A.PREVIOUS_BALANCE,B.READING_DATE,B.METER_NUMBER,C.RECHARGE_AMOUNT,B.closingBalance,D.PROPERTY_NO,A.serviceDate " +
							"FROM " +
							"( " +
							"	SELECT INITIAL_READING AS initial_Reading_EB,DG_READING AS initial_Reading_DG,PREVIOUS_BALANCE,TO_CHAR(service_start_date,'yyyy/MM/dd')AS serviceDate " +
							"	FROM PREPAID_METERS WHERE METER_NUMBER='"+list1.get(i)+"' " +
							")A, " +
							"( " +
							"	 SELECT BALANCE AS closingBalance,METER_NUMBER,READING_DATE FROM PREPAID_DAILY_CONSUMPTION " +
							"	 WHERE METER_NUMBER='"+list1.get(i)+"' AND READING_DATE= " +
							"	 ( " +
							"		 SELECT MAX(READING_DATE) FROM PREPAID_DAILY_CONSUMPTION " +
							"		 WHERE READING_DATE<=to_date('2017-03-31','yyyy-MM-dd') AND METER_NUMBER='"+list1.get(i)+"' " +
							"	 ) " +
							")B ," +
							"( " +
							"	 SELECT SUM(RECHARGE_AMOUNT) as RECHARGE_AMOUNT  FROM PREPAID_DAILY_CONSUMPTION WHERE METER_NUMBER='"+list1.get(i)+"' AND READING_DATE BETWEEN " +
							"	 (SELECT MIN(READING_DATE) FROM PREPAID_DAILY_CONSUMPTION WHERE READING_DATE<=to_date('2017-03-31','yyyy-MM-dd') AND meter_number='"+list1.get(i)+"') and " +
							"	 (SELECT MAX(READING_DATE) FROM PREPAID_DAILY_CONSUMPTION WHERE READING_DATE<=to_date('2017-03-31','yyyy-MM-dd') AND meter_number='"+list1.get(i)+"') " +
							")C, " +
							"( " +
							"	SELECT PROPERTY_NO FROM PROPERTY WHERE PROPERTY_ID=(SELECT PROPERTY_ID FROM PREPAID_METERS WHERE METER_NUMBER='"+list1.get(i)+"') " +
							")D, " +
							"( " +
							"	SELECT SUM(EB_UNITS)AS final_Reading_EB,SUM(DG_UNITS)AS final_Reading_DG FROM PREPAID_DAILY_CONSUMPTION " +
							"	WHERE READING_DATE<=to_date('2017-03-31','yyyy-MM-dd') and METER_NUMBER='"+list1.get(i)+"' " +
							")E ";
						
			
			List<?> list2 =entityManager.createNativeQuery(query2).getResultList();
			for (Iterator<?> iterator = list2.iterator(); iterator.hasNext();)
			{
				final Object[] values = (Object[]) iterator.next();
				wizardMap = new HashMap<String, Object>();
				wizardMap.put("initial_Reading_EB",  values[0]);	
				wizardMap.put("final_Reading_EB",    values[1]);
				wizardMap.put("consumption_Unit_EB", values[2]);	
				wizardMap.put("initial_Reading_DG",  values[3]);
				wizardMap.put("final_Reading_DG",    values[4]);
				wizardMap.put("consumption_Unit_DG", values[5]);
				wizardMap.put("PREVIOUS_BALANCE",    values[6]);	
				wizardMap.put("RECHARGE_AMOUNT",     values[9]);
				wizardMap.put("READING_DATE",        values[7]);
				wizardMap.put("meter_number",        values[8]);
				wizardMap.put("closingBalance",      values[10]);
				wizardMap.put("PROPERTY_NO",         values[11]);
				wizardMap.put("serviceDate",         values[12]);
				result.add(wizardMap);
			}
			noOfMeters++;
		}
		System.out.println("Total Number of Meters="+noOfMeters);
		return result;
	}
	
	@RequestMapping(value = "/accountStatement/getPdfReport", method = {RequestMethod.POST,RequestMethod.GET})
	public  void getPdfReport(HttpServletRequest request,HttpServletResponse response) throws ParseException, DocumentException, MalformedURLException, IOException, SQLException
	{
		System.out.println("*****************inside getPdfReport*****************");
		String a1 = request.getParameter("prePaidId");
		String a2 = request.getParameter("meterNo");
		String a3 = request.getParameter("readingDateTime");
		
		String a4 = request.getParameter("initial_Reading_EB");
		String a5 = request.getParameter("final_Reading_EB");
		String a6 = request.getParameter("consumption_Unit_EB");
		
		String a7 = request.getParameter("initial_Reading_DG");
		String a8 = request.getParameter("final_Reading_DG");
		String a9 = request.getParameter("consumption_Unit_DG");
		
		String a10 = request.getParameter("PREVIOUS_BALANCE");
		String a11 = request.getParameter("RECHARGE_AMOUNT");
		String a12 = request.getParameter("closingBalance");
		String a13 = request.getParameter("PROPERTY_NO");
		String a14 = request.getParameter("serviceDate");
		
		System.out.println("***************** a1="+a1+" a2="+a2+" a3"+a3+" a4="+a4+" a5="+a5+" a6="+a6+" a7="+a7+" a8="+a8+" a9="+a9+" a10="+a10+" a11="+a11+" a12="+a12+" a13="+a13+" a14="+a14+"*****************");
		/*
		String address =
		"SELECT (p.FIRST_NAME||' '||p.LAST_NAME) AS NAME,c.CONTACT_CONTENT FROM PERSON p,CONTACT c,PREPAID_METERS pm " +
		"WHERE p.PERSON_ID=c.PERSON_ID AND PM.PERSON_ID=c.PERSON_ID AND c.CONTACT_TYPE='Mobile' AND pm.METER_NUMBER="+a2;
		Object[] nameAndAddress = (Object[]) entityManager.createNativeQuery(address).getSingleResult();

		//************************************Generating Normal PDF for Account Statement***********************************************
		String fileName = ResourceBundle.getBundle("application").getString("skyon.accountStatement")+"AccountStatement("+a3+")"+".pdf";
		System.out.println("fileName="+fileName);
		Document document = new Document(PageSize.A4, 20, 20, 50, 50);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		PdfWriter writer=PdfWriter.getInstance(document, baos);
		Rectangle rect = new Rectangle(30, 30, 300, 810);
		writer.setBoxSize("art", rect);

		com.bcits.bfm.util.HeaderFooterForAccStatement event = new com.bcits.bfm.util.HeaderFooterForAccStatement();
		writer.setPageEvent(event);
		document.open(); 
		Paragraph p = new Paragraph(" ");
		p.setAlignment(Element.ALIGN_CENTER);
		document.add(p);
		Image image = Image.getInstance("C:/Users/user/Desktop/Not To Delete/skyon.png");
		image.scaleAbsolute(80,80);
		image.setAbsolutePosition(10f, 765f);
		image.setAlignment(image.LEFT);
		document.add(image);
		
		Paragraph paragraph 	  = new Paragraph("Consumer Name    : "+nameAndAddress[0],new Font(Font.FontFamily.HELVETICA, 8));
		Paragraph paragraph1	  = new Paragraph("Property Number  : "+a3,new Font(Font.FontFamily.HELVETICA, 8));
		Paragraph paragraph2	  = new Paragraph("Meter Number     : "+a2,new Font(Font.FontFamily.HELVETICA, 8));
		Paragraph paragraph3 	  = new Paragraph("Mobile Number    : "+nameAndAddress[1],new Font(Font.FontFamily.HELVETICA, 8));
		
		document.add(Chunk.SPACETABBING);
		document.add(Chunk.SPACETABBING);
		document.add(paragraph);
		document.add(paragraph1);
		document.add(paragraph2);
		document.add(paragraph3);
		document.add(Chunk.SPACETABBING);

		PdfPTable table = new PdfPTable(9);
		Font font1 = new Font(Font.FontFamily.HELVETICA  , 9, Font.BOLD);
		Font font3 = new Font(Font.FontFamily.HELVETICA, 8);

		table.addCell(new Paragraph("Meter Number",font1));
		table.addCell(new Paragraph("Property Number",font1));
		table.addCell(new Paragraph("Reading Date",font1));
		table.addCell(new Paragraph("Consumption",font1));
		table.addCell(new Paragraph("Total Recharge Amount",font1));
		table.addCell(new Paragraph("Balance",font1));
		table.addCell(new Paragraph("EB Units",font1));
		table.addCell(new Paragraph("DG Units",font1));
		table.addCell(new Paragraph("Cam Charges",font1));

		PdfPCell cell1 = new PdfPCell(new Paragraph((String)a2,font3));
		PdfPCell cell2 = new PdfPCell(new Paragraph((String)a3,font3));
		PdfPCell cell3 = new PdfPCell(new Paragraph((String)a4,font3));
		PdfPCell cell4 = new PdfPCell(new Paragraph((String)a5,font3));
		PdfPCell cell5 = new PdfPCell(new Paragraph((String)a6,font3));
		PdfPCell cell6 = new PdfPCell(new Paragraph((String)a7,font3));
		PdfPCell cell7 = new PdfPCell(new Paragraph((String)a8,font3));
		PdfPCell cell8 = new PdfPCell(new Paragraph((String)a9,font3));
		PdfPCell cell9 = new PdfPCell(new Paragraph((String)a10,font3));
		
		table.addCell(cell1);
		table.addCell(cell2);
		table.addCell(cell3);
		table.addCell(cell4);
		table.addCell(cell5);
		table.addCell(cell6);
		table.addCell(cell7);
		table.addCell(cell8);
		table.addCell(cell9);

		table.setWidthPercentage(100);
		float[] columnWidths = {14f, 14f, 14f, 19f, 12f, 15f, 15f,18f,18f};

		table.setWidths(columnWidths);

		document.add(table);
		document.close();

		FileOutputStream fileOut = new FileOutputStream(fileName);    	
		baos.writeTo(fileOut);
		fileOut.flush();
		fileOut.close();

		ServletOutputStream servletOutputStream;

		servletOutputStream = response.getOutputStream();
		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "inline;filename=\"AccountStatement("+a3+").pdf"+"\"");
		FileInputStream input = new FileInputStream(fileName);
		IOUtils.copy(input, servletOutputStream);		
		servletOutputStream.flush();
		servletOutputStream.close();*/

		//*****************************************************Nomal PDF Ends************************************************************
		
		System.out.println("********************************Account Statement for Skyon Jasper Report*********************************");
		String address = "	SELECT (p.FIRST_NAME||' '||p.LAST_NAME) AS NAME,c.CONTACT_CONTENT,a.ADDRESS1,a.ADDRESS2"
				+ "	FROM PERSON p,CONTACT c,PREPAID_METERS pm ,ADDRESS a "
				+ " WHERE p.PERSON_ID=c.PERSON_ID AND PM.PERSON_ID=c.PERSON_ID AND a.PERSON_ID=p.PERSON_ID "
				+ " AND c.CONTACT_TYPE='Mobile' AND pm.METER_NUMBER="+a2;
		
		Object[] nameAndAddress1 = (Object[]) entityManager.createNativeQuery(address).getSingleResult();
		
		String fileName1 = ResourceBundle.getBundle("application").getString("skyon.accountStatement")+"AccountStatement("+a13+")"+".pdf";
		HashMap<String, Object> param = new HashMap<String, Object>();
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
		param.put("name",nameAndAddress1[0]);
		param.put("propertyNo",a13);
		
		String blockName=(String) entityManager.createNativeQuery("SELECT BLOCK_NAME FROM BLOCK WHERE BLOCK_ID=(SELECT BLOCK_ID FROM PROPERTY WHERE PROPERTY_NO='"+a13+"')").getSingleResult();
		param.put("address",a13+" "+blockName);	
		param.put("city", "Gurugram");
		param.put("secondaryAddress",nameAndAddress1[2]+" "+nameAndAddress1[3]);
		int  area=(int) entityManager.createQuery("select p.area from Property p where p.property_No='"+a13+"'").getSingleResult();
		param.put("area",area);
		param.put("billNo", "N/A");			
		
		Calendar start = Calendar.getInstance();
		param.put("billDate",new SimpleDateFormat("dd-MMM-yyyy").format(start.getTime()));
		param.put("mtrNo",a2);
		    
		Date servicedate=new SimpleDateFormat("yyyy/MM/dd").parse(a14);
		param.put("billingPeriod",new SimpleDateFormat("dd MMMM yyyy").format(servicedate)+ " To 31 March 2017");
		param.put("serviceDate",a14);
		
		param.put("previousBal",Double.parseDouble(a10));
		param.put("rechargeAmt",a11);
		
		long bal=(long) (Double.parseDouble(a11)+Double.parseDouble(a10)-Double.parseDouble(a12));
		param.put("consumptionAmt",bal);
		param.put("closingBal",Double.parseDouble(a12));

		param.put("ebReadInit", a4);
		param.put("ebReadFinal",a5);
		param.put("ebConsUnits",a6);
		param.put("ebInitRate", "12.0");
		param.put("ebConsAmt",  String.valueOf(Math.round(Double.parseDouble(a6)*12)));
		
		param.put("dgReadInit", a7);
		param.put("dgReadFinal",a8);
		param.put("dgConsUnits",a9);
		param.put("dgInitRate", "12.0");
		param.put("dgConsAmt",  String.valueOf(Math.round(Double.parseDouble(a9)*12)));
		
		param.put("grossTotal",String.valueOf(Math.round((Double.parseDouble(a6)*12)+(Double.parseDouble(a9)*12))));
		
		Integer numToWord= (int) Math.round((Double.parseDouble(a6)*12)+(Double.parseDouble(a9)*12));
		String amountInWords = NumberToWord.convertNumberToWords(numToWord.intValue());
		param.put("amountInWords", amountInWords + " Only");
		
		JREmptyDataSource jre = new JREmptyDataSource();
		JasperPrint jasperPrint;
		JasperReport report;
		try 
		{
			System.out.println("===================================== filling the report =====================================");
			jasperPrint = JasperFillManager.fillReport(this.getClass().getClassLoader().getResourceAsStream("reports/AccountStatementVV.jasper"),param,jre);

			removeBlankPage(jasperPrint.getPages());
			byte[] bytes = JasperExportManager.exportReportToPdf(jasperPrint);
			InputStream myInputStream = new ByteArrayInputStream(bytes);
			Blob blob = Hibernate.createBlob(myInputStream);
			/*=====================================to save the BLOB as PDF in the given path=====================================*/
				InputStream is = blob.getBinaryStream();
				FileOutputStream fos = new FileOutputStream(fileName1);
				int b = 0;
				while ((b = is.read()) != -1)
				{
					fos.write(b); 
				}
				System.out.println("===================================== File Saved at <"+fileName1+">=====================================");
			/*=====================================to display the the saved PDF file=============================================*/
				ServletOutputStream servletOutputStream1;
				servletOutputStream1 = response.getOutputStream();
				response.setContentType("application/pdf");
				response.setHeader("Content-Disposition", "inline;filename=\"AccountStatement("+a13+").pdf"+"\"");
				FileInputStream input1 = new FileInputStream(fileName1);
				IOUtils.copy(input1, servletOutputStream1);		
				servletOutputStream1.flush();
				servletOutputStream1.close();
				
		} catch (JRException e) {
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("===================================== IOException =====================================");
		}			
		
		//*******************************************************************************************************************************
	}
	private void removeBlankPage(List<JRPrintPage> pages) {
		System.out.println("=====================================In Side RemoveBlankPage()=====================================");
		for (Iterator<JRPrintPage> i = pages.iterator(); i.hasNext();) {
			JRPrintPage page = i.next();
			if (page.getElements().size() == 4)
				i.remove();
		}
	}
}
