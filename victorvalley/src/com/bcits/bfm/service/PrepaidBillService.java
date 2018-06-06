package com.bcits.bfm.service;

import java.util.Date;
import java.util.List;

import com.bcits.bfm.model.PrepaidBillDetails;

public interface PrepaidBillService extends GenericService<PrepaidBillDetails> {
   
	public List<PrepaidBillDetails> getData();
	public long getCount(int propertyId,Date presentDate);
	public long getBillCount(int propid);
	
	
	
	
	
	
	public List<?> ReadPropertys();
	public void updateMailSent_Status(String billNo, String status);
}
