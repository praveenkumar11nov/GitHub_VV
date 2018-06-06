package com.bcits.bfm.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletResponse;

import org.joda.time.DateTime;
import org.joda.time.Days;
import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bcits.bfm.service.tariffManagement.TariffCalculationService;
import com.google.gson.Gson;

public class Test {

	@PersistenceContext
	public static EntityManager entityManager;
	
	@Autowired 	
	TariffCalculationService tariffCalculationService;	
	@SuppressWarnings("null")
	public static void main(String[] args) throws ParseException, IOException 
	{

	
	/*System.out.println("==================ServiceStartDate > CamServiceStartsOn=============");
		Date lastBillDate    = new SimpleDateFormat("dd/MM/yyyy").parse("01/01/2018");
		Date currentBillDate = new SimpleDateFormat("dd/MM/yyyy").parse("01/01/2018");
		 
		Calendar cal = Calendar.getInstance();
		cal.setTime(currentBillDate);
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		cal.add(Calendar.DATE, 1);
		
		Days days = Days.daysBetween(new DateTime(lastBillDate),new DateTime(cal.getTime()));
		
		System.out.println("lastBillDate="+lastBillDate);
		System.out.println("currentBillDate="+cal.getTime());
	    System.err.println("Days Difference="+days.getDays());*/
/******************************************************************************************************************************/
	/*	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Date currentBillDate = new SimpleDateFormat("dd/MM/yyyy").parse("01/01/2018");
		
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(currentBillDate);
		cal2.set(Calendar.DAY_OF_MONTH, cal2.getActualMaximum(Calendar.DAY_OF_MONTH));
		cal2.add(Calendar.DATE, 1);
		
		System.err.println("sdf.format(cal2.getTime()) = "+sdf.format(cal2.getTime())); 
		
		Date utd = new SimpleDateFormat("dd/MM/yyyy").parse(sdf.format(cal2.getTime()));
		
		
		System.err.println(cal2.getTime());
		System.err.println("SQL Date = " + new java.sql.Date(utd.getTime()));*/
		
/******************************************************************************************************************************/
	/*	Date toDate   = new SimpleDateFormat("dd/MM/yyyy").parse("01/02/2018");
		Date fromDate = new SimpleDateFormat("dd/MM/yyyy").parse("01/01/2018");
		Calendar cal1 = Calendar.getInstance(); 
		cal1.setTime(fromDate); 
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(toDate);

		int	yearDiff  = cal2.get(Calendar.YEAR) - cal1.get(Calendar.YEAR); 
		int monthDiff = yearDiff * 12 + cal2.get(Calendar.MONTH) - cal1.get(Calendar.MONTH);
		System.out.println(" fromDate="+fromDate+"..........toDate="+toDate+"..........MonthDifference="+monthDiff);*/
		
/******************************************************************************************************************************/
	//======================= Month and Year in Integer numbers
	/*	Date currentBillDate1 = new SimpleDateFormat("dd/MM/yyyy").parse("01/01/2018");
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(currentBillDate1);
		
		System.err.println("MONTH="+cal2.get(Calendar.MONTH)+1);
		System.err.println("YEAR="+cal2.get(Calendar.YEAR));
		*/
	}
}

class GoogleResults{
	 
    private ResponseData responseData;
    public ResponseData getResponseData() { return responseData; }
    public void setResponseData(ResponseData responseData) { this.responseData = responseData; }
    public String toString() { return "ResponseData[" + responseData + "]"; }
 
    static class ResponseData {
        private List<Result> results;
        public List<Result> getResults() { return results; }
        public void setResults(List<Result> results) { this.results = results; }
        public String toString() { return "Results[" + results + "]"; }
    }
 
    static class Result {
        private String url;
        private String title;
        public String getUrl() { return url; }
        public String getTitle() { return title; }
        public void setUrl(String url) { this.url = url; }
        public void setTitle(String title) { this.title = title; }
        public String toString() { return "Result[url:" + url +",title:" + title + "]"; }
    }
}
