package com.bcits.bfm.controller;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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
import org.codehaus.jettison.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bcits.bfm.model.Contact;
import com.bcits.bfm.model.Person;
import com.bcits.bfm.model.PrePaidMeters;
import com.bcits.bfm.model.PrepaidConsumptionEntity;
import com.bcits.bfm.model.SmsEmailForLowBal;
import com.bcits.bfm.service.LowBalanceStoreService;
import com.bcits.bfm.service.PrePaidMeterService;
import com.bcits.bfm.service.PrepaidDailyConsumService;
import com.bcits.bfm.service.PrepaidPaymentAdjustmentService;
import com.bcits.bfm.service.customerOccupancyManagement.PersonService;
import com.bcits.bfm.util.EmailCredentialsDetailsBean;
import com.bcits.bfm.util.HeaderFooterPageEvent;
import com.bcits.bfm.util.SendMailForOwnersDetails;
import com.bcits.bfm.util.SendSMSForStatus;
import com.bcits.bfm.util.SmsCredentialsDetailsBean;
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
public class PrepaidConsumptionHtyController {

	static Logger logger = LoggerFactory.getLogger(PrepaidConsumptionHtyController.class);
	@Autowired
	private PrepaidPaymentAdjustmentService prepaidPaymentAdjustmentService;

	@Autowired
	private PrepaidDailyConsumService prepaidDailyConsumService;

	@Autowired
	private PersonService personService;

	@Autowired
	private PrePaidMeterService prePaidMeterService;
	
	@Autowired
	private LowBalanceStoreService lowBalanceStoreService;
	
	@PersistenceContext(unitName="bfm")
	protected EntityManager entityManager;

	@RequestMapping(value = "/consumptionHty")
	public String History() {
		return "consumptionHistory";
	}

	//@RequestMapping(value = "/consumptionHty/prepaidbilldataDaily", method = { RequestMethod.GET, RequestMethod.POST })
	@Scheduled(cron = "${scheduling.job.prepaidConsumptiondata}")
	public void callWebServiceConsump() throws IOException, ParseException {

		List<PrepaidConsumptionEntity> list = new ArrayList<>();
		Date startDate = prepaidDailyConsumService.getMaxDate();
		System.out.println("StartDate "+startDate);
		if (startDate != null) {
			String strDate=new SimpleDateFormat("dd/MM/yyyy").format(startDate);
			System.out.println("StartDate11 "+strDate);
			Date nextDate=new SimpleDateFormat("dd/MM/yyyy").parse(strDate);
			Calendar start = Calendar.getInstance();
			start.setTime(nextDate);
			start.add(Calendar.DATE, 1);
			Date d = new Date();
			Calendar end = Calendar.getInstance();
			end.setTime(d);
			end.add(Calendar.DATE, -1);
             System.out.println("datetete  "+end.getTime());
             System.out.println(start.before(end));
			for (Date date1 = start.getTime(); start.before(end); start.add(Calendar.DATE,1), date1 = start.getTime()) {
                    System.out.println("in side loop");
				String date = new SimpleDateFormat("yyyyMMdd").format(date1);
				System.out.println("DATE       " + date);
				String string1 = "DAILYCONSUMPTION";
				String string2 = "{Date:" + date + "}";
				String string3 = "IREO_WEB_CALL";
				String string4 = "WEB_CALL_ADMIN@IREO987";
				String responseString = "";
				String outputString = "";
				String wsURL = "http://122.160.87.14:81/service.asmx";
				URL url = new URL(wsURL);
				URLConnection connection = url.openConnection();
				HttpURLConnection httpConn = (HttpURLConnection) connection;
				ByteArrayOutputStream bout = new ByteArrayOutputStream();
				String xmlInput = " <soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">\n"
						+ " <soap12:Body>\n" + " <liveEmsTransaction xmlns=\"http://tempuri.org/\">\n" + " <TXN_NAME>"
						+ string1 + "</TXN_NAME>\n" + " <DATA>" + string2 + "</DATA>\n" + " <username>" + string3
						+ "</username>\n" + " <password>" + string4 + "</password>\n" + " </liveEmsTransaction>\n"
						+ " </soap12:Body>\n" + " </soap12:Envelope>";

				byte[] buffer = new byte[xmlInput.length()];
				buffer = xmlInput.getBytes();
				bout.write(buffer);
				byte[] b = bout.toByteArray();
				String SOAPAction = "http://tempuri.org/liveEmsTransaction";
				// Set the appropriate HTTP parameters.
				httpConn.setRequestProperty("Content-Length", String.valueOf(b.length));
				httpConn.setRequestProperty("Content-Type", "text/xml; charset=utf-8");
				httpConn.setRequestProperty("SOAPAction", SOAPAction);
				httpConn.setRequestMethod("POST");
				httpConn.setDoOutput(true);
				httpConn.setDoInput(true);
				OutputStream out = httpConn.getOutputStream();

				// Write the content of the request to the outputstream of the
				// HTTP Connection.
				out.write(b);
				out.close();
				// Ready with sending the request.

				// Read the response.
				InputStreamReader isr = new InputStreamReader(httpConn.getInputStream());
				BufferedReader in = new BufferedReader(isr);

				// Write the SOAP message response to a String.
				while ((responseString = in.readLine()) != null) {
					outputString = outputString + responseString;
					// System.out.println(outputString);
				}
				JSONObject jsonObject;
				try {
					jsonObject = new JSONObject(outputString);
					System.out.println(jsonObject.get("Status"));
					if (jsonObject.get("Status").equals("Failed")) {
						System.out.println("in side if condition .....Date not available in neptune system ....." + date);
					} else {
						JSONArray array = (JSONArray) jsonObject.get("data");
						for (int i = 0; i < array.length(); i++) {
							SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");
							Date readingDate = dateFormat.parse(array.getJSONObject(i).getString("date"));
							long count = prepaidDailyConsumService
									.checkPriousData(array.getJSONObject(i).getString("ca_no"), readingDate);
							if (count == 0) {
								
								PrepaidConsumptionEntity consumptionEntity = new PrepaidConsumptionEntity();
								// System.out.println(array.getJSONObject(i));
								consumptionEntity.setCa_NO(array.getJSONObject(i).getString("ca_no"));
								consumptionEntity.setMeterNo(array.getJSONObject(i).getString("DEVICE_SLNO"));

								consumptionEntity.setDate(dateFormat.parse(array.getJSONObject(i).getString("date")));
								consumptionEntity
										.setEbUnit(Double.parseDouble(array.getJSONObject(i).getString("ebunit")));
								consumptionEntity
										.setDgUnit(Double.parseDouble(array.getJSONObject(i).getString("dgunit")));
								consumptionEntity
										.seteB_AMT(Double.parseDouble(array.getJSONObject(i).getString("EBAMT")));
								consumptionEntity
										.setDg_AMT(Double.parseDouble(array.getJSONObject(i).getString("DGAMT")));
								consumptionEntity.setFixedCharges(
										Double.parseDouble(array.getJSONObject(i).getString("FIXEDCHARGES")));
								consumptionEntity.setRecharge_Amt(
										Long.parseLong(array.getJSONObject(i).getString("rechargeamt")));
								consumptionEntity
										.setBalance(Double.valueOf(array.getJSONObject(i).getString("Balance")));
								consumptionEntity.setCum_eb_reading(Double.valueOf(array.getJSONObject(i).getString("EB_PV_READING")));
								consumptionEntity.setCum_dg_reading(Double.valueOf(array.getJSONObject(i).getString("DG_PV_READING")));
								//System.out.println("startDate   "+startDate);
								String cano=array.getJSONObject(i).getString("ca_no");
								//System.out.println("CA NUMBER "+cano);
								Object[] objdata=prepaidDailyConsumService.getpreviousBalance(cano);
								//System.out.println("objData "+objdata.length);
								double currentBal=Double.valueOf(array.getJSONObject(i).getString("Balance"));
								if(objdata!=null){
								double preBalance=0.0;
								if(objdata.length!=0){
									 preBalance=Double.parseDouble(objdata[0]+"");
								}
								if(currentBal>preBalance){
									int noofTimesRechDone=prepaidDailyConsumService.autoGenerateNum();
									consumptionEntity.setNoofTimeRech(noofTimesRechDone);
								}else{
									consumptionEntity.setNoofTimeRech(Integer.parseInt(objdata[1]+""));
								}
								}else{
									int noofTimesRechDone=prepaidDailyConsumService.autoGenerateNum();
									consumptionEntity.setNoofTimeRech(noofTimesRechDone);
								}
								list.add(consumptionEntity);
								prepaidDailyConsumService.save(consumptionEntity);
							}
						}
					}
					System.out.println(list.size());
				} catch (JSONException e) {

					e.printStackTrace();
				}
			}
		} else {
			Date d = new Date();
			Calendar cal = Calendar.getInstance();
			cal.setTime(d);
			cal.add(Calendar.DATE, -1);
			Date presentDate = cal.getTime();
			String date = new SimpleDateFormat("yyyyMMdd").format(presentDate);
			System.out.println("Previous Date " + date);
			String string1 = "DAILYCONSUMPTION";
			String string2 = "{Date:"+date+"}";
			//String string2 = "{Date:20170209}";
			String string3 = "IREO_WEB_CALL";
			String string4 = "WEB_CALL_ADMIN@IREO987";
			String responseString = "";
			String outputString = "";
			String wsURL = "http://122.160.87.14:81/service.asmx";
			URL url = new URL(wsURL);
			URLConnection connection = url.openConnection();
			HttpURLConnection httpConn = (HttpURLConnection) connection;
			ByteArrayOutputStream bout = new ByteArrayOutputStream();
			String xmlInput = " <soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">\n"
					+ " <soap12:Body>\n" + " <liveEmsTransaction xmlns=\"http://tempuri.org/\">\n" + " <TXN_NAME>"
					+ string1 + "</TXN_NAME>\n" + " <DATA>" + string2 + "</DATA>\n" + " <username>" + string3
					+ "</username>\n" + " <password>" + string4 + "</password>\n" + " </liveEmsTransaction>\n"
					+ " </soap12:Body>\n" + " </soap12:Envelope>";

			byte[] buffer = new byte[xmlInput.length()];
			buffer = xmlInput.getBytes();
			bout.write(buffer);
			byte[] b = bout.toByteArray();
			String SOAPAction = "http://tempuri.org/liveEmsTransaction";
			// Set the appropriate HTTP parameters.
			httpConn.setRequestProperty("Content-Length", String.valueOf(b.length));
			httpConn.setRequestProperty("Content-Type", "text/xml; charset=utf-8");
			httpConn.setRequestProperty("SOAPAction", SOAPAction);
			httpConn.setRequestMethod("POST");
			httpConn.setDoOutput(true);
			httpConn.setDoInput(true);
			OutputStream out = httpConn.getOutputStream();

			// Write the content of the request to the outputstream of the
			// HTTP Connection.
			out.write(b);
			out.close();
			// Ready with sending the request.

			// Read the response.
			InputStreamReader isr = new InputStreamReader(httpConn.getInputStream());
			BufferedReader in = new BufferedReader(isr);

			// Write the SOAP message response to a String.
			while ((responseString = in.readLine()) != null) {
				outputString = outputString + responseString;
				//System.out.println(outputString);
			}
			JSONObject jsonObject;
			try {
				jsonObject = new JSONObject(outputString);
				System.out.println(jsonObject.get("Status"));
				if (jsonObject.get("Status").equals("Failed")) {
					System.out.println(
							"in side if condition .....Date not available in neptune system ....." + date);
				} else {
					JSONArray array = (JSONArray) jsonObject.get("data");
					for (int i = 0; i < array.length(); i++) {
						PrepaidConsumptionEntity consumptionEntity = new PrepaidConsumptionEntity();
						// System.out.println(array.getJSONObject(i));
						consumptionEntity.setCa_NO(array.getJSONObject(i).getString("ca_no"));
						consumptionEntity.setMeterNo(array.getJSONObject(i).getString("DEVICE_SLNO"));
						SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");
						consumptionEntity.setDate(dateFormat.parse(array.getJSONObject(i).getString("date")));
						consumptionEntity.setEbUnit(Double.parseDouble(array.getJSONObject(i).getString("ebunit")));
						consumptionEntity.setDgUnit(Double.parseDouble(array.getJSONObject(i).getString("dgunit")));
						consumptionEntity.seteB_AMT(Double.parseDouble(array.getJSONObject(i).getString("EBAMT")));
						consumptionEntity.setDg_AMT(Double.parseDouble(array.getJSONObject(i).getString("DGAMT")));
						consumptionEntity
								.setFixedCharges(Double.parseDouble(array.getJSONObject(i).getString("FIXEDCHARGES")));
						consumptionEntity
								.setRecharge_Amt(Long.parseLong(array.getJSONObject(i).getString("rechargeamt")));
						consumptionEntity.setBalance(Double.valueOf(array.getJSONObject(i).getString("Balance")));
						consumptionEntity.setCum_eb_reading(Double.valueOf(array.getJSONObject(i).getString("EB_PV_READING")));
						consumptionEntity.setCum_dg_reading(Double.valueOf(array.getJSONObject(i).getString("DG_PV_READING")));
						consumptionEntity.setNoofTimeRech(prepaidDailyConsumService.autoGenerateNum());
						list.add(consumptionEntity);
						prepaidDailyConsumService.save(consumptionEntity);
					}
				}
				System.out.println(list.size());
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "/consumptionHistory/readData", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<?> getConsumptionHtry(HttpServletRequest request) throws ParseException {
		System.out.println("From Date  === " + request.getParameter("fromDate"));
		System.out.println("To Date === " + request.getParameter("toDate"));
		System.out.println("consumerId : " + request.getParameter("consumerID"));
		String fromDate = request.getParameter("fromDate");
		String presentdate = request.getParameter("toDate");
		SimpleDateFormat formatter = new SimpleDateFormat("MMM yyyy");
		Date todate = formatter.parse(presentdate);
		Date fromdate = formatter.parse(fromDate);
		System.out.println("date from to date" + fromDate + " " + presentdate);
		// List<Map<String, Object>> maplist = new ArrayList<Map<String,
		// Object>>();
		List<Map<String, Object>> prEntities = prepaidDailyConsumService.getConsumpData(todate, fromdate,
				request.getParameter("consumerID"));
		return prEntities;
	}

	@RequestMapping(value = "/getconsumptionHistirySearchByMonth", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<?> getAllDataByMonth(HttpServletRequest req) {
		String frDate = req.getParameter("fromDate");
		String toDate = req.getParameter("toDate");
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		Date fromDate = null;
		Date todate = null;
		try {
			fromDate = dateFormat.parse(frDate);
			todate = dateFormat.parse(toDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		List<Map<String, Object>> maList = prepaidDailyConsumService.getDataByDateWise(fromDate, todate);
		return maList;
	}

	@RequestMapping(value = "/consumptionHistory/exportConsumptionData", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String exportConsumptionHistoryFile(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException {

		logger.info("hi_________________________----------------");

		String fileName = ResourceBundle.getBundle("application").getString("bfm.exportCsvFilePath")
				+ DateFormatUtils.format(new Date(), "MMM yyyy") + ".xlsx";

		System.out.println("FromDate " + request.getParameter("date1"));
		System.out.println("ToDate " + request.getParameter("date2"));
		String fromDate = request.getParameter("date1");
		String presentdate = request.getParameter("date2");
		Date fromdate = null;
		Date todate = null;
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		fromdate = dateFormat.parse(fromDate);
		todate = dateFormat.parse(presentdate);
		List<PrepaidConsumptionEntity> dailyData = new ArrayList<>();
		dailyData = prepaidDailyConsumService.getConsumptionDayWise(fromdate, todate);
		System.out.println("list size++++++++++" + dailyData.size());

		String sheetName = "Templates";// name of sheet

		XSSFWorkbook wb = new XSSFWorkbook();
		XSSFSheet sheet = wb.createSheet(sheetName);

		XSSFRow header = sheet.createRow(0);

		XSSFCellStyle style = wb.createCellStyle();
		style.setWrapText(true);
		XSSFFont font = wb.createFont();
		font.setFontName(HSSFFont.FONT_ARIAL);
		font.setFontHeightInPoints((short) 10);
		font.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);
		style.setFont(font);

		header.createCell(0).setCellValue("CA Number");
		header.createCell(1).setCellValue("Meter Number");
		header.createCell(2).setCellValue("Reading Date");
		header.createCell(3).setCellValue("Balance");
		header.createCell(4).setCellValue("EB UNITS");
		header.createCell(5).setCellValue("DG UNITS");
		header.createCell(6).setCellValue("EB AMOUNT");
		header.createCell(7).setCellValue("DG AMOUNT");
		header.createCell(8).setCellValue("Fixed Charges");
		header.createCell(9).setCellValue("Recharge Amount");
		header.createCell(10).setCellValue("EB MTR Reading");
		header.createCell(11).setCellValue("DG MTR Reading");
		

		for (int j = 0; j <= 11; j++) {
			header.getCell(j).setCellStyle(style);
			sheet.setColumnWidth(j, 8000);
			sheet.setAutoFilter(CellRangeAddress.valueOf("A1:Q200"));
		}

		int count = 1;
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm ");
		for (PrepaidConsumptionEntity prePaidDailyData : dailyData) {
			// final Object[] values=(Object[]) iterator.next();

			XSSFRow row = sheet.createRow(count);

			if (prePaidDailyData.getCa_NO() != null) {

				row.createCell(0).setCellValue(prePaidDailyData.getCa_NO());
			}
			if (prePaidDailyData.getMeterNo() != null) {

				row.createCell(1).setCellValue(prePaidDailyData.getMeterNo());

			}

			if (prePaidDailyData.getDate() != null) {

				row.createCell(2).setCellValue(sdf.format(prePaidDailyData.getDate()));

			}
			if (prePaidDailyData.getBalance() != 0.0) {

				row.createCell(3).setCellValue(prePaidDailyData.getBalance());

			}

			row.createCell(4).setCellValue(prePaidDailyData.getEbUnit());

			row.createCell(5).setCellValue(prePaidDailyData.getDgUnit());

			row.createCell(6).setCellValue(prePaidDailyData.geteB_AMT());

			row.createCell(7).setCellValue(prePaidDailyData.getDg_AMT());
			row.createCell(8).setCellValue(prePaidDailyData.getFixedCharges());
			row.createCell(9).setCellValue(prePaidDailyData.getRecharge_Amt());
			row.createCell(10).setCellValue(prePaidDailyData.getCum_eb_reading());
			row.createCell(11).setCellValue(prePaidDailyData.getCum_dg_reading());

			count++;
		}

		FileOutputStream fileOut = new FileOutputStream(fileName);
		wb.write(fileOut);
		fileOut.flush();
		fileOut.close();

		ServletOutputStream servletOutputStream;

		servletOutputStream = response.getOutputStream();
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "inline;filename=\"Consumption History.xlsx" + "\"");
		FileInputStream input = new FileInputStream(fileName);
		IOUtils.copy(input, servletOutputStream);
		// servletOutputStream.w
		servletOutputStream.flush();
		servletOutputStream.close();

		return null;
	}

	@RequestMapping(value = "/consumptionHistory/exportPDFConsumptionData", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String exportConsumptionHtyToPdf(HttpServletRequest request, HttpServletResponse response)
			throws ParseException, DocumentException, MalformedURLException, IOException {
		logger.info("in side Export PDF");
		String fileName = ResourceBundle.getBundle("application").getString("bfm.exportCsvFilePath")
				+ DateFormatUtils.format(new Date(), "MMM yyyy") + ".pdf";
		logger.info("FromMonth " + request.getParameter("fromDate"));
		logger.info("ToMonth " + request.getParameter("consumerID"));
		logger.info("PropertyId " + request.getParameter("propertyId"));

		String fromDate = request.getParameter("fromDate");
		String consumerId = request.getParameter("consumerID");
		int propertyId = Integer.parseInt(request.getParameter("propertyId"));
		SimpleDateFormat formatter = new SimpleDateFormat("MMMM yyyy");
		// Date todate = formatter.parse(presentdate);
		Date fromdate = formatter.parse(fromDate);
		System.out.println("date from to date" + fromDate);
		List<Object[]> dailyData = new ArrayList<>();
		dailyData = prepaidDailyConsumService.getConsumption(fromdate, consumerId);
		System.out.println("list size++++++++++" + dailyData.size());
		Document document = new Document(PageSize.A4, 20, 20, 50, 50);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		PdfWriter writer = PdfWriter.getInstance(document, baos);
		Rectangle rect = new Rectangle(30, 30, 300, 810);
		writer.setBoxSize("art", rect);

		HeaderFooterPageEvent event = new com.bcits.bfm.util.HeaderFooterPageEvent();
		writer.setPageEvent(event);
		document.open();
		Paragraph p = new Paragraph(" ");
		p.setAlignment(Element.ALIGN_CENTER);
		document.add(p);
		Image image = Image.getInstance("C:/Victory valley.jpg");
		image.scaleAbsolute(75, 75);
		image.setAbsolutePosition(20f, 765f);
		image.setAlignment(image.LEFT);
		document.add(image);
		String mobileNo = null;
		String emailID = null;
		// System.err.println(prePaidMeterService.getPersonId(propertyId));
		Person person = personService.find(prePaidMeterService.getPersonId(propertyId));
		// System.out.println(person.getFirstName());
		Set<Contact> contactsList = person.getContacts();
		for (Contact contact : contactsList) {
			if (contact.getContactPrimary().equals("Yes")) {
				if (contact.getContactType().equals("Email")) {
					contact.getContactContent();
					// payUForm.setCustomerEmail(contact.getContactContent());
				} else {
					mobileNo = contact.getContactContent();
					// payUForm.setCustomerMobile(contact.getContactContent());
				}
			}
		}
		Paragraph paragraphempty = new Paragraph(" ");
		Paragraph paragraph = new Paragraph("Consumer Name: " + person.getFirstName() + person.getLastName(),
				new Font(Font.FontFamily.HELVETICA, 8));
		Paragraph paragraph1 = new Paragraph("Property Number: " + prePaidMeterService.getPropertyNo(propertyId),
				new Font(Font.FontFamily.HELVETICA, 8));
		Paragraph paragrap2 = new Paragraph("CA Number     :  " + prepaidDailyConsumService.getCANumber(propertyId),
				new Font(Font.FontFamily.HELVETICA, 8));
		Paragraph paragrap3 = new Paragraph("Mobile Number   : " + mobileNo, new Font(Font.FontFamily.HELVETICA, 8));
		document.add(paragraphempty);
		document.add(paragraph);
		document.add(paragraph1);
		document.add(paragrap2);
		document.add(paragrap3);
		document.add(new Paragraph("Consumption Month : " + fromDate, new Font(Font.FontFamily.HELVETICA, 8)));
		document.add(Chunk.SPACETABBING);
		PdfPTable table = new PdfPTable(11);
		Font font1 = new Font(Font.FontFamily.HELVETICA, 9, Font.BOLD);
		Font font3 = new Font(Font.FontFamily.HELVETICA, 8);

		
		table.addCell(new Paragraph("Meter Number", font1));
		table.addCell(new Paragraph("Reading Date", font1));
		table.addCell(new Paragraph("Balance", font1));
		table.addCell(new Paragraph("EB UNITS", font1));
		table.addCell(new Paragraph("DG UNITS", font1));
		table.addCell(new Paragraph("EB Amount", font1));
		table.addCell(new Paragraph("DG Amount", font1));
		table.addCell(new Paragraph("Fixed Charges", font1));
		table.addCell(new Paragraph("Recharge Amount", font1));
		table.addCell(new Paragraph("EB MTR Units", font1));
		table.addCell(new Paragraph("DG MTR Units", font1));

		int i = 0;
		/*
		 * Date date=null; int month=0; int year=0; String postType=""; String
		 * ledgerType="";
		 */
		// XSSFCell cell = null;
		for (Object[] consumptionHtry : dailyData) {

			//PdfPCell cell1 = new PdfPCell(new Paragraph((String) consumptionHtry[1], font3));
			PdfPCell cell1 = new PdfPCell(new Paragraph((String) consumptionHtry[2], font3));
			PdfPCell cell2 = new PdfPCell(
					new Paragraph(new SimpleDateFormat("dd/MM/yyyy").format((Timestamp) consumptionHtry[3]), font3));
			PdfPCell cell3 = new PdfPCell(new Paragraph(String.valueOf(consumptionHtry[10]), font3));
			PdfPCell cell4 = new PdfPCell(new Paragraph(String.valueOf(consumptionHtry[4]), font3));
			PdfPCell cell5 = new PdfPCell(new Paragraph(String.valueOf(consumptionHtry[5]), font3));
			PdfPCell cell6 = new PdfPCell(new Paragraph(String.valueOf(consumptionHtry[6]), font3));
			PdfPCell cell7 = new PdfPCell(new Paragraph(String.valueOf(consumptionHtry[7]), font3));
			PdfPCell cell8 = new PdfPCell(new Paragraph(String.valueOf(consumptionHtry[8]), font3));
			PdfPCell cell9 = new PdfPCell(new Paragraph(String.valueOf(consumptionHtry[9]), font3));
			PdfPCell cell10 = new PdfPCell(new Paragraph(String.valueOf(consumptionHtry[11]), font3));
			PdfPCell cell11 = new PdfPCell(new Paragraph(String.valueOf(consumptionHtry[12]), font3));
			table.addCell(cell1);
			table.addCell(cell2);
			table.addCell(cell3);
			table.addCell(cell4);
			table.addCell(cell5);
			table.addCell(cell6);
			table.addCell(cell7);
			table.addCell(cell8);
			table.addCell(cell9);
			table.addCell(cell10);
			table.addCell(cell11);

			table.setWidthPercentage(100);
			float[] columnWidths = { 14f, 14f, 10f, 12f, 12f, 12f, 14f, 14f, 14f, 14f,14f };

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
		response.setHeader("Content-Disposition", "inline;filename=\"Consumption History.pdf" + "\"");
		FileInputStream input = new FileInputStream(fileName);
		IOUtils.copy(input, servletOutputStream);
		// servletOutputStream.w
		servletOutputStream.flush();
		servletOutputStream.close();
		return null;
	}

	
	//@Scheduled(cron = "${scheduling.job.prepaidLowBalanceAlert}")
	  public void escalationSheduler(){
		System.out.println("in side scheduling-------");
		EmailCredentialsDetailsBean emailCredentialsDetailsBean=null;
		  try {
		  emailCredentialsDetailsBean = new EmailCredentialsDetailsBean();
		} catch (Exception e) {
			e.printStackTrace();
		}
		  
		SmsCredentialsDetailsBean smsCredentialsDetailsBean = new SmsCredentialsDetailsBean();
		List<?> resultList=prepaidDailyConsumService.SendingLowBalanceStatus();
		System.out.println(resultList);
		
		for(Iterator<?> iterator=resultList.iterator();iterator.hasNext();){
			
		     final Object[] value=(Object[]) iterator.next();
		    /* int instId=Integer.parseInt(value[0].toString());
		     System.out.println("id  === "+instId);*/
		    // String personMessage = "Dear "+""+", Your accounts has been "+"Activated"+". Your account details are username : "+""+" & password : "+""+" - Skyon RWA  Administration services.";
		        int nooftimesRec=Integer.parseInt(value[3].toString());
		        double balance=Double.parseDouble(value[2].toString());
		        int personId=Integer.parseInt(value[4].toString());
		        String caNum=value[0].toString();
		        String meterNo=value[1].toString();
		        int propId=Integer.parseInt(value[5].toString());
		        System.out.println(balance+", "+personId+",  "+meterNo+", "+nooftimesRec+", "+propId);
		        String propertyNO=prePaidMeterService.getPropertyNo(propId);
		        String mobile1=null;
		        String email1=null;
		      //  Account account = accountService.find(accountId);
		  		Person person = personService.find(personId);
		  		Set<Contact> contactsList = person.getContacts();
		  		for (Contact contact : contactsList) {
		  			if(contact.getContactPrimary().equals("Yes")){
		  				if(contact.getContactType().equals("Email")){
		  					email1=contact.getContactContent();
		  				}else{
		  				mobile1=contact.getContactContent();
		  				
		  				}
		  			}
		  		}
		  		int personID=lowBalanceStoreService.getEstateManager();
		  		Person person1 = personService.find(personID);
		  		String email=null;
		  		String mob=null;
		  		Set<Contact> contactsList1 = person1.getContacts();
		  		for (Contact contact : contactsList1) {
		  			if(contact.getContactPrimary().equals("Yes")){
		  				if(contact.getContactType().equals("Email")){
		  					email=contact.getContactContent();
		  				}else{
		  					mob=contact.getContactContent();
		  				
		  				}
		  			}
		  		}
		  		
		      if((balance<=1000) && (balance>750)){
		    	  System.out.println("1 st attempt");
		    	 List<SmsEmailForLowBal> entry=lowBalanceStoreService.getAllData(caNum, nooftimesRec);
		    	 if(entry.isEmpty()){
		  		SmsEmailForLowBal lowBal=new SmsEmailForLowBal();
		  		lowBal.setCa_num(caNum);
		  		lowBal.setRechargedStatus(nooftimesRec);
		  		lowBal.setMailSendDate(new Date());
		  		lowBal.setStatus("s1");
		  		lowBalanceStoreService.save(lowBal);
		  		String personMessage="Dear Resident,"+"<br/><br>"+"your prepaid Utility balance of Flat no. "+propertyNO+" is getting low. Kindly recharge at the earliest. your present Utility balance is Rs."+balance+"/-."+"-VVCOWA Resident services.";
		  		 //String personMessage = "Dear Resident,"+"<br/><br>"+"Your prepaid electricity balance is low. Kindly recharge at the earliest. Present available balance is Rs."+balance+"/-."+"-Skyon RWA  Administration services";
		  		 String personMessage1 = "Dear Resident,"
		  		                         +"<br><br>"
		  				                 +"your prepaid Utility balance of Flat no. "+propertyNO+" is getting low. Kindly recharge at the earliest. Present available balance is Rs."+balance+"/-."
		  		                         +"<br><br>"
		  				                 +"<br/>Best Regards,<br/>"
							             + "VVCOWA Resident services.<br/>"
							             +"<p><font size=1>This is an auto generated Email. Please don't revert back.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Serviced by Newage Living Solutions</font></p>"
							             +"</body></html>";	
		  		 
		  		sendLowBalanceAlertForCustomers(propertyNO,mobile1,email1,person,personMessage,personMessage1,emailCredentialsDetailsBean,smsCredentialsDetailsBean);
		  		sendLowBalanceAlertForEstateManager(propertyNO,mob,email,person1,personMessage,personMessage1,emailCredentialsDetailsBean,smsCredentialsDetailsBean);
		  		
		    	 }
		      }else if ((balance<=750) && (balance>500)) {
		    	  System.out.println("2 nd attempt");
		    	  List<SmsEmailForLowBal> entry=lowBalanceStoreService.getAllData1(caNum, nooftimesRec);
		    	  if(entry.isEmpty()){
				  		SmsEmailForLowBal lowBal=new SmsEmailForLowBal();
				  		lowBal.setCa_num(caNum);
				  		lowBal.setRechargedStatus(nooftimesRec);
				  		lowBal.setMailSendDate(new Date());
				  		lowBal.setStatus("s2");
				  		lowBalanceStoreService.save(lowBal);
				  		String personMessage="Dear Resident,"+"<br><br>"+"your prepaid Utility balance of Flat no. "+propertyNO+" is getting low.  Kindly recharge at the earliest for uninterrupted power supply. Present available balance is Rs."+balance+"/-."+"-VVCOWA Resident services.";
				  			                
				  		String personMessage1 = "Dear Resident,"
		                                          +"<br><br>"
				                                  +"your prepaid Utility balance of Flat no. "+propertyNO+" is getting low. Kindly recharge at the earliest for uninterrupted power supply. Present available balance is Rs."+balance+"/-."
		                                          +"<br><br>"
				                                  +"<br/>Best Regards,<br/>"
					                              + "VVCOWA Resident services.<br/>"
					                              +"<p><font size=1>This is an auto generated Email. Please don't revert back.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Serviced by Newage Living Solutions</font></p>"
					                              +"</body></html>";	
				  		sendLowBalanceAlertForCustomers(propertyNO,mobile1,email1,person,personMessage,personMessage1,emailCredentialsDetailsBean,smsCredentialsDetailsBean);
				  		sendLowBalanceAlertForEstateManager(propertyNO,mob,email,person1,personMessage,personMessage1,emailCredentialsDetailsBean,smsCredentialsDetailsBean);
				    	 }
			}else if(balance<=500){
				  System.out.println("3rd attempt");
				 List<SmsEmailForLowBal> entry=lowBalanceStoreService.getAllData2(caNum, nooftimesRec);
				 if(entry.isEmpty()){
				  		SmsEmailForLowBal lowBal=new SmsEmailForLowBal();
				  		lowBal.setCa_num(caNum);
				  		lowBal.setRechargedStatus(nooftimesRec);
				  		lowBal.setMailSendDate(new Date());
				  		lowBal.setStatus("s3");
				  		lowBalanceStoreService.save(lowBal);
				  		String personMessage="Dear Resident,"+"<br><br>"+"your prepaid Utility balance of Flat no. "+propertyNO+" is getting low. Kindly recharge at the earliest for uninterrupted power supply. Present available balance is Rs."+balance+"/-."+"-VVCOWA Resident services.";
				  			                
				  		 String personMessage1 = "Dear Resident,"
		                                        +"<br><br>"
				                                +"your prepaid Utility balance of Flat no. "+propertyNO+" is getting low. Kindly recharge at the earliest for uninterrupted power supply. Present available balance is Rs."+balance+"/-."
		                                        +"<br><br>"
				                                +"<br/>Best Regards,<br/>"
					                            + "VVCOWA Resident services.<br/>"
					                            +"<p><font size=1>This is an auto generated Email. Please don't revert back.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Serviced by Newage Living Solutions</font></p>"
					                            +"</body></html>";	
				  		sendLowBalanceAlertForCustomers(propertyNO,mobile1,email1,person,personMessage,personMessage1,emailCredentialsDetailsBean,smsCredentialsDetailsBean);
				  		sendLowBalanceAlertForEstateManager(propertyNO,mob,email,person1,personMessage,personMessage1,emailCredentialsDetailsBean,smsCredentialsDetailsBean);
				    	 }
			}
		       
		      
		}
	}
	

	private void sendLowBalanceAlertForEstateManager(String propertyNO, String mob, String email,
			Person person1,String personMessage,String personMessage1,EmailCredentialsDetailsBean emailCredentialsDetailsBean,SmsCredentialsDetailsBean smsCredentialsDetailsBean) {
		logger.info("ïn side sendLowBalanceAlertForEstateManager methode");
		System.err.println("email "+email +"            "+"mob  "+mob);
		smsCredentialsDetailsBean.setNumber(mob);
		smsCredentialsDetailsBean.setUserName(person1.getFirstName());
		smsCredentialsDetailsBean.setMessage(personMessage);
		new Thread(new SendSMSForStatus(smsCredentialsDetailsBean)).start();
		emailCredentialsDetailsBean.setMailSubject("VVCOWA");
	    emailCredentialsDetailsBean.setToAddressEmail(email);
		emailCredentialsDetailsBean.setMessageContent(personMessage1);
		new Thread(new SendMailForOwnersDetails(emailCredentialsDetailsBean)).start();
	}




	private void sendLowBalanceAlertForCustomers(String propertyNO, String mobile1, String email1,
			Person person,String personMessage,String personMessage1,EmailCredentialsDetailsBean emailCredentialsDetailsBean,SmsCredentialsDetailsBean smsCredentialsDetailsBean) {
		logger.info("in side sendLowBalanceAlertForCustomers methode");
		
		System.out.println("mobile Number "+mobile1+"   "+" emailId "+email1);
			smsCredentialsDetailsBean.setNumber(mobile1);
	  		smsCredentialsDetailsBean.setUserName(person.getFirstName());
	  		smsCredentialsDetailsBean.setMessage(personMessage);
	  		new Thread(new SendSMSForStatus(smsCredentialsDetailsBean)).start();
	  		emailCredentialsDetailsBean.setMailSubject("VVCOWA");
		    emailCredentialsDetailsBean.setToAddressEmail(email1);
			emailCredentialsDetailsBean.setMessageContent(personMessage1);
			new Thread(new SendMailForOwnersDetails(emailCredentialsDetailsBean)).start();
		   
	  		
		
	}
	/************************************ HOURLY WEBSERVICES FOR LOW BALANCE ALERT (25-09-217)*****************************/
      //@RequestMapping(value="/consumptionHty/hourlyWebSrvicesforLowBalance",method = { RequestMethod.GET, RequestMethod.POST })
	  @Scheduled(cron = "${scheduling.job.HourlyWebServicesForPrepaidLowBalance}")
	  public void hourlyWebSrvicesforLowBalance() throws IOException
	  {
		System.out.println("---------------------------INSIDE HOURLY WEBSERVICES FOR LOW BALANCE ALERT----------------------------------");
		EmailCredentialsDetailsBean emailCredentialsDetailsBean = null;
		SmsCredentialsDetailsBean smsCredentialsDetailsBean = new SmsCredentialsDetailsBean();
		try 
		{
		  emailCredentialsDetailsBean = new EmailCredentialsDetailsBean();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		/*********************************** getting data for low balance alert <Calling the WebServices> *****************************/
		Date todayDate = new Date(); 
		String date = new SimpleDateFormat("yyyyMMdd").format(todayDate);
		String string1 = "LIVEDATA";
		String string2 = "{date:" + date + "}";
		String string3 = "IREO_WEB_CALL";
		String string4 = "WEB_CALL_ADMIN@IREO987";
		String responseString = "";
		String outputString = "";
		String wsURL = "http://122.160.87.14:81/service.asmx";
		System.out.println("___TXN_NAME:"+string1+"___DATA:"+string2+"___username:"+string3+"___password:"+string4);
		
		URL url = new URL(wsURL);
		URLConnection connection = url.openConnection();
		HttpURLConnection httpConn = (HttpURLConnection) connection;
		ByteArrayOutputStream bout = new ByteArrayOutputStream();
		String xmlInput = " <soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">\n"
				+ " <soap12:Body>\n" + " <liveEmsTransaction xmlns=\"http://tempuri.org/\">\n" + " <TXN_NAME>"
				+ string1 + "</TXN_NAME>\n" + " <DATA>" + string2 + "</DATA>\n" + " <username>" + string3
				+ "</username>\n" + " <password>" + string4 + "</password>\n" + " </liveEmsTransaction>\n"
				+ " </soap12:Body>\n" + " </soap12:Envelope>";

		byte[] buffer = new byte[xmlInput.length()];
		buffer = xmlInput.getBytes();
		bout.write(buffer);
		byte[] b = bout.toByteArray();
		String SOAPAction = "http://tempuri.org/liveEmsTransaction";
		// Set the appropriate HTTP parameters.
		httpConn.setRequestProperty("Content-Length", String.valueOf(b.length));
		httpConn.setRequestProperty("Content-Type", "text/xml; charset=utf-8");
		httpConn.setRequestProperty("SOAPAction", SOAPAction);
		httpConn.setRequestMethod("POST");
		httpConn.setDoOutput(true);
		httpConn.setDoInput(true);
		OutputStream out = httpConn.getOutputStream();

		// Write the content of the request to the outputstream of the 	// HTTP Connection.
		out.write(b);
		out.close();
		
		// Ready with sending the request	// Read the response.
		InputStreamReader isr=null ;
		BufferedReader in=null ;
		try {
			 isr = new InputStreamReader(httpConn.getInputStream());
			 in = new BufferedReader(isr);
		}catch (Exception e) {
			System.out.println("************************SERVER EXCEPTION 403************************"); 
			e.printStackTrace();
		}
		
		

		// Write the SOAP message response to a String.
		while ((responseString = in.readLine()) != null) {
			outputString = outputString + responseString;
		}
		JSONObject jsonObject;
		try 
		{
			int count=0;
			jsonObject = new JSONObject(outputString); 
			System.out.println("************************************* Response Form Server *************************************");
			System.out.println(jsonObject.get("Status"));
			if (jsonObject.get("Status").equals("Failed")) 
			{
				System.out.println("in side if condition .....Date not available in neptune system ....." + date);
			} 
			else 
			{
				JSONArray array = (JSONArray) jsonObject.get("data");	int i;
				/*****************************getting the previous low balance status*****************************/
				//List<?> lowBalList = lowBalanceStoreService.getHourlyLowBalanceStatus();
				for (i = 0; i < array.length(); i++) 
				{
					/*Object[] lowBalList = null;
					SmsEmailForLowBal low = null;
					String meterNum = array.getJSONObject(i).getString("DEVICE_SLNO");
					String lowBalanceQuery = "SELECT LID,CA_NUMBER,RECHARGED_STATUS,STATUS,MAILSEND_DATE,NVL(RECHARGED_AMT,0) "
					+ " FROM LOWBALANCE_STATUS WHERE LID IN(SELECT MAX(LID) FROM LOWBALANCE_STATUS "
					+ "GROUP BY CA_NUMBER) AND CA_NUMBER=(SELECT PM.CA_NO FROM PREPAID_METERS pm WHERE PM.METER_NUMBER="+meterNum+")";*/
					if(array.getJSONObject(i).getString("PV_BAL")!=null){
					if(Double.valueOf(array.getJSONObject(i).getString("PV_BAL"))<=1000 ){
					
					try 
					{
						/*lowBalList = (Object[]) entityManager.createNativeQuery(lowBalanceQuery).getSingleResult();
						String lid 				  = lowBalList[0]+"";
						String caNum 			  = lowBalList[1]+"";
						String rechargeStatus 	  = lowBalList[2]+"";
						String lowBalanceStaus    = lowBalList[3]+"";
						String mailSentDate 	  = lowBalList[4]+"";
						String RECHARGED_AMT_LOW  = lowBalList[5]+"";*/
						
						String PV_BAL = array.getJSONObject(i).getString("PV_BAL");
						String RECHARGED_AMT_WEB = array.getJSONObject(i).getString("RECHARGE");
						String propertyNO=array.getJSONObject(i).getString("CA_ADDRESS");
						String meterNo=array.getJSONObject(i).getString("DEVICE_SLNO");
						Object[] obj=null;
						try{
						String query="SELECT CA_NO,PERSON_ID FROM PREPAID_METERS WHERE METER_NUMBER='"+meterNo+"'";
						
						 obj=(Object[]) entityManager.createNativeQuery(query).getSingleResult();
						System.err.println("obj "+obj);
						}catch(Exception e){
							
						}
						if(obj!=null){
							
							count++;
							String caNum="";
							int personId=0;
							
								caNum=obj[0]+"";
								personId=Integer.valueOf(obj[1]+"");
							
								System.err.println("caNum "+caNum+"************************ "+"personId "+personId);
						    String mobile1=null;
						    String email1=null;
						  //  Account account = accountService.find(accountId);
							Person person = personService.find(personId);
							Set<Contact> contactsList = person.getContacts();
							for (Contact contact : contactsList) {
								if(contact.getContactPrimary().equals("Yes")){
									if(contact.getContactType().equals("Email")){
										email1=contact.getContactContent();
									}else{
									mobile1=contact.getContactContent();
									
									}
								}
							}
							int personID=lowBalanceStoreService.getEstateManager();
							Person person1 = personService.find(personID);
							String email=null;
							String mob=null;
							Set<Contact> contactsList1 = person1.getContacts();
							for (Contact contact : contactsList1) {
								if(contact.getContactPrimary().equals("Yes")){
									if(contact.getContactType().equals("Email")){
										email=contact.getContactContent();
									}else{
										mob=contact.getContactContent();
									
									}
								}
							}
						System.out.println("----------------------------------------------------------------------");
						//System.out.println("lid="+lid+"__caNum="+caNum+"__rechargeStatus="+rechargeStatus+"__lowBalanceStaus="+lowBalanceStaus+"__mailSentDate="+mailSentDate+"RECHARGED_AMT_LOW="+RECHARGED_AMT_LOW);
						System.out.println("PV_BAL="+PV_BAL+"__RECHARGED_AMT_WEB="+RECHARGED_AMT_WEB+"meterNo "+meterNo); 
						System.out.println("----------------------------------------------------------------------");
						
						if(Double.parseDouble(PV_BAL) < 1000 && Double.parseDouble(PV_BAL) > 500) 
						{
							 System.out.println("1st attempt");
							 List<SmsEmailForLowBal> entry=lowBalanceStoreService.getAllDatalowbalance(caNum, RECHARGED_AMT_WEB);
							 if(entry.isEmpty())
							 {
								 SmsEmailForLowBal lowBal=new SmsEmailForLowBal();
								 lowBal.setCa_num(caNum);
								 lowBal.setRechargedStatus(0);
								 lowBal.setMailSendDate(new Date());
								 lowBal.setStatus("s1");
								 lowBal.setRechargeAmt(RECHARGED_AMT_WEB);
								 lowBalanceStoreService.save(lowBal);
								String personMessage="Dear Resident,"+"<br/><br>"+"your prepaid Utility balance of Flat no. "+propertyNO+" is getting low. Kindly recharge at the earliest. your present Utility balance is Rs."+PV_BAL+"/-."+"-VVCOWA Resident services.";
								//String personMessage = "Dear Resident,"+"<br/><br>"+"Your prepaid electricity balance is low. Kindly recharge at the earliest. Present available balance is Rs."+balance+"/-."+"-Skyon RWA  Administration services";
								String personMessage1 = "Dear Resident,"
							                         +"<br><br>"
									                 +"your prepaid Utility balance of Flat no. "+propertyNO+" is getting low. Kindly recharge at the earliest. Present available balance is Rs."+PV_BAL+"/-."
							                         +"<br><br>"
									                 +"<br/>Best Regards,<br/>"
										             + "VVCOWA Resident services.<br/>"
										             +"<p><font size=1>This is an auto generated Email. Please don't revert back.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Serviced by Newage Living Solutions</font></p>"
										             +"</body></html>";	
							 
								sendLowBalanceAlertForCustomers(propertyNO,mobile1,email1,person,personMessage,personMessage1,emailCredentialsDetailsBean,smsCredentialsDetailsBean);
								sendLowBalanceAlertForEstateManager(propertyNO,mob,email,person1,personMessage,personMessage1,emailCredentialsDetailsBean,smsCredentialsDetailsBean);
								System.out.println("************************propertyNO="+propertyNO+" & mob="+mob+" & email="+email+" & person1="+person1);
							 }

				}  else if (Double.parseDouble(PV_BAL) <=500 && Double.parseDouble(PV_BAL)>0) 
				     {
						  System.out.println("2nd attempt");
						  List<SmsEmailForLowBal> entry=lowBalanceStoreService.getAllDatahourly(caNum, RECHARGED_AMT_WEB);
						  if(entry.isEmpty())
						  {
						  		SmsEmailForLowBal lowBal=new SmsEmailForLowBal();
						  		lowBal.setCa_num(caNum);
						  		lowBal.setRechargedStatus(0);
						  		lowBal.setMailSendDate(new Date());
						  		lowBal.setRechargeAmt(RECHARGED_AMT_WEB);
						  		lowBal.setStatus("s2");
						  		lowBalanceStoreService.save(lowBal);
						  		String personMessage="Dear Resident,"+"<br><br>"+"your prepaid Utility balance of Flat no. "+propertyNO+" is getting low.  Kindly recharge at the earliest for uninterrupted power supply. Present available balance is Rs."+PV_BAL+"/-."+"-VVCOWA Resident services.";
						  			                
						  		String personMessage1 = "Dear Resident,"
						                                  +"<br><br>"
						                                  +"your prepaid Utility balance of Flat no. "+propertyNO+" is getting low. Kindly recharge at the earliest for uninterrupted power supply. Present available balance is Rs."+PV_BAL+"/-."
						                                  +"<br><br>"
						                                  +"<br/>Best Regards,<br/>"
							                              + "VVCOWA Resident services.<br/>"
							                              +"<p><font size=1>This is an auto generated Email. Please don't revert back.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Serviced by Newage Living Solutions</font></p>"
							                              +"</body></html>";	
						  		sendLowBalanceAlertForCustomers(propertyNO,mobile1,email1,person,personMessage,personMessage1,emailCredentialsDetailsBean,smsCredentialsDetailsBean);
						  		sendLowBalanceAlertForEstateManager(propertyNO,mob,email,person1,personMessage,personMessage1,emailCredentialsDetailsBean,smsCredentialsDetailsBean);
						  		System.out.println("************************propertyNO="+propertyNO+" & mob="+mob+" & email="+email+" & person1="+person1);
						 }
				}
				   else if(Double.parseDouble(PV_BAL) <=0)
				   {
						  System.out.println("3rd attempt");
						 List<SmsEmailForLowBal> entry=lowBalanceStoreService.getAllDatahourly1(caNum, RECHARGED_AMT_WEB);
						 if(entry.isEmpty())
						 {
						  		SmsEmailForLowBal lowBal=new SmsEmailForLowBal();
						  		lowBal.setCa_num(caNum);
						  		lowBal.setRechargedStatus(0);
						  		lowBal.setMailSendDate(new Date());
						  		lowBal.setRechargeAmt(RECHARGED_AMT_WEB);
						  		lowBal.setStatus("s3");
						  		lowBalanceStoreService.save(lowBal);
						  		String personMessage="Dear Resident,"+"<br><br>"+"your prepaid Utility balance of Flat no. "+propertyNO+" is getting low. Kindly recharge at the earliest for uninterrupted power supply. Present available balance is Rs."+PV_BAL+"/-."+"-VVCOWA Resident services.";
						  			                
						  		 String personMessage1 = "Dear Resident,"
						                                +"<br><br>"
						                                +"your prepaid Utility balance of Flat no. "+propertyNO+" is getting low. Kindly recharge at the earliest for uninterrupted power supply. Present available balance is Rs."+PV_BAL+"/-."
						                                +"<br><br>"
						                                +"<br/>Best Regards,<br/>"
							                            + "VVCOWA Resident services.<br/>"
							                            +"<p><font size=1>This is an auto generated Email. Please don't revert back.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Serviced by Newage Living Solutions</font></p>"
							                            +"</body></html>";	
						  		sendLowBalanceAlertForCustomers(propertyNO,mobile1,email1,person,personMessage,personMessage1,emailCredentialsDetailsBean,smsCredentialsDetailsBean);
						  		sendLowBalanceAlertForEstateManager(propertyNO,mob,email,person1,personMessage,personMessage1,emailCredentialsDetailsBean,smsCredentialsDetailsBean);
						  		System.out.println("************************propertyNO="+propertyNO+" & mob="+mob+" & email="+email+" & person1="+person1);
						 }
				}
						}else{
						
							System.err.println("in side else meterNumber "+array.getJSONObject(i).getString("DEVICE_SLNO"));
						}
						
					}
					catch (Exception e) 
					{
						e.printStackTrace();
						System.out.println("");
						System.out.println("Data not found for DEVICE_SLNO="+array.getJSONObject(i).getString("DEVICE_SLNO"));
						System.out.println("");
					}
				}
				
				}
				}
				System.out.println("count"+count);
				System.out.println("total Number of Properties = "+i);
			}
		} 
		catch (Exception e)
		{
			System.out.println("****************************Something Went Wrong****************************");
		}

	/*********************************************************************************************************************/	
	}

    /*  @Async
	public void sendlowBalanceSmsandMail(EmailCredentialsDetailsBean emailCredentialsDetailsBean,
			SmsCredentialsDetailsBean smsCredentialsDetailsBean, int count, JSONArray array, int i)
			throws JSONException {
		
		
	}*/
}
