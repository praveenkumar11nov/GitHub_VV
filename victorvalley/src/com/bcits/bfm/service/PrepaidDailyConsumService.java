package com.bcits.bfm.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.bcits.bfm.model.PrepaidConsumptionEntity;

public interface PrepaidDailyConsumService extends GenericService<PrepaidConsumptionEntity>{

	List<Map<String, Object>> getConsumpData(Date todate, Date fromdate, String meterNo);

	List<Map<String, Object>> getDataByDateWise(Date fromDate, Date todate);

	List<PrepaidConsumptionEntity> getConsumptionDayWise(Date fromdate, Date todate);

	List<Object[]> getConsumption(Date fromdate, String consumerId);

	Date getMaxDate();

	long checkPriousData(String string, Date readingDate);

	List<Object[]> getConsumptionDetails(Date frDate, Date todate, String meterNumber);

	double getMinBalance(Date minDate, String meterNo);

	double getMaxBalance(Date maxDate, String meterNo);

	long getRechargeAmtDuringPeriod(Date presentdate, String meterNo);

	Object[] getcurrentBalence(Date minDate, String meterNo);

	Object[] getpreviousBalance(String caNum);

	int autoGenerateNum();

	List<?> SendingLowBalanceStatus();

	String getCANumber(int propertyId);

	

	


}
