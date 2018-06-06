package com.bcits.bfm.service;

import java.util.List;

import com.bcits.bfm.model.SmsEmailForLowBal;

public interface LowBalanceStoreService extends GenericService<SmsEmailForLowBal>{

	
	public List<SmsEmailForLowBal> getAllData(String caNo,int nooftimesRec);
	public List<SmsEmailForLowBal> getAllData1(String caNo,int nooftimesRec);
	public List<SmsEmailForLowBal> getAllData2(String caNo,int nooftimesRec);
	public int getEstateManager();
	//public List<?> getHourlyLowBalanceStatus();
	public List<SmsEmailForLowBal> getAllDatalowbalance(String caNum,
			String rECHARGED_AMT_WEB);
	
	public List<SmsEmailForLowBal> getAllDatahourly(String caNum,
			String rECHARGED_AMT_WEB);
	public List<SmsEmailForLowBal> getAllDatahourly1(String caNum,
			String rECHARGED_AMT_WEB);
	
}
