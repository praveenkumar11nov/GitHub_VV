package com.bcits.bfm.serviceImpl;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.bcits.bfm.model.PrepaidConsumptionEntity;
import com.bcits.bfm.service.PrepaidDailyConsumService;

@Repository
public class PrepaidDailyConsumServiceImpl extends GenericServiceImpl<PrepaidConsumptionEntity> implements PrepaidDailyConsumService {

	@Override
	public List<Map<String, Object>> getConsumpData(Date todate, Date fromdate, String meterNo) {
		/*DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
	 String	fromDate=dateFormat.format(fromdate);
	 String toDate=dateFormat.format(todate);*/
		 Calendar cal=Calendar.getInstance();
		 cal.setTime(fromdate);
		 //cal.getMinimum(arg0)
		 int month=cal.get(Calendar.MONTH);
		 int fromMonth=month+1;
		 int fromYear=cal.get(Calendar.YEAR);
		 cal.setTime(todate);
		 int month1=cal.get(Calendar.MONTH);
		 int toMonth=month1+1;
		 int toYear=cal.get(Calendar.YEAR);
		 String fromDate=fromYear+"-"+fromMonth+"-"+cal.getMinimalDaysInFirstWeek();
		 String toDate=toYear+"-"+toMonth+"-"+cal.getActualMaximum(Calendar.DAY_OF_MONTH);
           List<Map<String, Object>> rList=new ArrayList<>();
           Map<String, Object> map=null;
           DateFormat dateFormat=new SimpleDateFormat("dd/MM/yyyy");
      try{
    	  List<PrepaidConsumptionEntity> consumptionEntities=entityManager.createNamedQuery("PrepaidConsumptionEntity.getConsumptionHtry").setParameter("fromDate", fromDate).setParameter("toDate", toDate).setParameter("meterNo", meterNo).getResultList();
    	    for (PrepaidConsumptionEntity prepaidConsumptionEntity : consumptionEntities) {
				map=new HashMap<>();
				map.put("consupId", prepaidConsumptionEntity.getConsupId());
				map.put("ca_NO", prepaidConsumptionEntity.getCa_NO());
				map.put("meterNo", prepaidConsumptionEntity.getMeterNo());
				map.put("readingDT", dateFormat.format(prepaidConsumptionEntity.getDate()));
				map.put("balance", prepaidConsumptionEntity.getBalance());
				map.put("ebUnit", prepaidConsumptionEntity.getEbUnit());
				map.put("dgUnit", prepaidConsumptionEntity.getDgUnit());
				map.put("eB_AMT", prepaidConsumptionEntity.geteB_AMT());
				map.put("dg_AMT", prepaidConsumptionEntity.getDg_AMT());
				map.put("fixedCharges", prepaidConsumptionEntity.getFixedCharges());
				map.put("recharge_Amt", prepaidConsumptionEntity.getRecharge_Amt());
				map.put("cum_eb_reading", prepaidConsumptionEntity.getCum_eb_reading());
				map.put("cum_dg_reading", prepaidConsumptionEntity.getCum_dg_reading());
				rList.add(map);
			}
    	    return rList;
      }catch(Exception e){
    	  e.printStackTrace();
      }
		return null;
	}

	@Override
	public List<Map<String, Object>> getDataByDateWise(Date fromDate, Date todate) {
		DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		String frDate=dateFormat.format(fromDate);
		String tDate=dateFormat.format(todate);
		 List<Map<String, Object>> rList=new ArrayList<>();
         Map<String, Object> map=null;
         DateFormat dateFormat1=new SimpleDateFormat("dd/MM/yyyy");
		try{
			List<PrepaidConsumptionEntity> consumptionEntities=entityManager.createNamedQuery("PrepaidConsumptionEntity.getDataDayWise").setParameter("fromDate", frDate).setParameter("toDate", tDate).getResultList();
			 for (PrepaidConsumptionEntity prepaidConsumptionEntity : consumptionEntities) {
					map=new HashMap<>();
					map.put("consupId", prepaidConsumptionEntity.getConsupId());
					map.put("ca_NO", prepaidConsumptionEntity.getCa_NO());
					map.put("meterNo", prepaidConsumptionEntity.getMeterNo());
					map.put("readingDT",dateFormat1.format(prepaidConsumptionEntity.getDate()));
					map.put("balance", prepaidConsumptionEntity.getBalance());
					map.put("ebUnit", prepaidConsumptionEntity.getEbUnit());
					map.put("dgUnit", prepaidConsumptionEntity.getDgUnit());
					map.put("eB_AMT", prepaidConsumptionEntity.geteB_AMT());
					map.put("dg_AMT", prepaidConsumptionEntity.getDg_AMT());
					map.put("fixedCharges", prepaidConsumptionEntity.getFixedCharges());
					map.put("recharge_Amt", prepaidConsumptionEntity.getRecharge_Amt());
					map.put("cum_eb_reading", prepaidConsumptionEntity.getCum_eb_reading());
					map.put("cum_dg_reading", prepaidConsumptionEntity.getCum_dg_reading());
					rList.add(map);
				}
	    	    return rList;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<PrepaidConsumptionEntity> getConsumptionDayWise(Date fromdate, Date todate) {
		DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		String frDate=dateFormat.format(fromdate);
		String tDate=dateFormat.format(todate);
		try{
			return entityManager.createNamedQuery("PrepaidConsumptionEntity.getDataDayWise").setParameter("fromDate", frDate).setParameter("toDate", tDate).getResultList();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Object[]> getConsumption(Date fromdate, String consumerId) {
		Calendar cal=Calendar.getInstance();
		cal.setTime(fromdate);
		int month=cal.get(Calendar.MONTH);
		int fromMonth=month+1;
		int year=cal.get(Calendar.YEAR);
		try{
			return entityManager.createNamedQuery("PrepaidConsumptionEntity.exportPDF").setParameter("month", fromMonth).setParameter("year", year).setParameter("meterNo", consumerId).getResultList();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Date getMaxDate() {
		try{
			return (Date) entityManager.createNamedQuery("PrepaidConsumptionEntity.getMaxDate").getSingleResult();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public long checkPriousData(String caNo, Date readingDate) {
		String fromDate=new SimpleDateFormat("yyyy-MM-dd").format(readingDate);
		try{
			return (long) entityManager.createNamedQuery("PrepaidConsumptionEntity.getCount").setParameter("caNO", caNo).setParameter("fromDate", fromDate).getSingleResult();
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getConsumptionDetails(Date frDate, Date todate, String meterNumber) {
		/*Calendar cal=Calendar.getInstance();
		 cal.setTime(frDate);
		 //cal.getMinimum(arg0)
		 int month=cal.get(Calendar.MONTH);
		 int fromMonth=month+1;
		 int fromYear=cal.get(Calendar.YEAR);
		 cal.setTime(todate);
		 int month1=cal.get(Calendar.MONTH);
		 int toMonth=month1+1;
		 int toYear=cal.get(Calendar.YEAR);
		 String fromDate=fromYear+"-"+fromMonth+"-"+cal.getMinimalDaysInFirstWeek();
		 String toDate=toYear+"-"+toMonth+"-"+cal.getActualMaximum(Calendar.DAY_OF_MONTH);
          List<Map<String, Object>> rList=new ArrayList<>();
          Map<String, Object> map=null;
          DateFormat dateFormat=new SimpleDateFormat("dd/MM/yyyy");*/
     try{
   	return entityManager.createNamedQuery("PrepaidConsumptionEntity.getConsumptionData").setParameter("fromDate", frDate).setParameter("toDate", todate).setParameter("meterNo", meterNumber).getResultList();
	
	}catch(Exception e){
		e.printStackTrace();
	}
 	return null;
	}

	@Override
	public double getMinBalance(Date minDate, String meterNo) {
		 Calendar cal=Calendar.getInstance();
	 	  cal.setTime(minDate);
	 	  cal.add(Calendar.DATE, -1);
	 	 Date fromDate=cal.getTime();
		try{
			return  (double) entityManager.createNamedQuery("PrepaidConsumptionEntity.getBalance").setParameter("fromDate", fromDate).setParameter("mtrSrNo", meterNo).getSingleResult();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public double getMaxBalance(Date maxDate, String meterNo) {
		// TODO Auto-generated method stub
		try{
			return  (double) entityManager.createNamedQuery("PrepaidConsumptionEntity.getBalance").setParameter("fromDate", maxDate).setParameter("mtrSrNo", meterNo).getSingleResult();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public long getRechargeAmtDuringPeriod(Date presentdate, String meterNo) {
		Calendar cal=Calendar.getInstance();
		cal.setTime(presentdate);
	    int m1=cal.get(Calendar.MONTH);
	    int month=m1+1;
	    int year=cal.get(Calendar.YEAR);
		try{
			return (long) entityManager.createNamedQuery("PrepaidConsumptionEntity.getRechrgeAmtDuringPer").setParameter("meterNo", meterNo).setParameter("month", month).setParameter("year", year).getSingleResult();
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public Object[] getcurrentBalence(Date minDate, String meterNo) {
		try{
			return (Object[]) entityManager.createNamedQuery("PrepaidConsumptionEntity.getCurrentBalance").setParameter("fromDate", minDate).setParameter("mtrSrNo", meterNo).getSingleResult();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Object[] getpreviousBalance(String caNum) {
		//String readingDate=new SimpleDateFormat("yyyy-MM-dd").format(startDate);
		try{
			return (Object[]) entityManager.createNamedQuery("PrepaidConsumptionEntity.getPreviousBal").setParameter("ca_NO", caNum).getSingleResult();
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public int autoGenerateNum() {
		return ((BigDecimal)entityManager.createNativeQuery("SELECT INCREMENT_NUM_SEQ.nextval FROM dual").getSingleResult()).intValue();
	}

	@Override
	public List<?> SendingLowBalanceStatus() {
		try{
			return entityManager.createNamedQuery("PrepaidConsumptionEntity.getDataForLowBal").getResultList();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String getCANumber(int propertyId) {
		try{
			return (String) entityManager.createQuery("select pp.ca_no from PrePaidMeters pp where pp.propertyId=:propertyId").setParameter("propertyId", propertyId).getSingleResult();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

}
