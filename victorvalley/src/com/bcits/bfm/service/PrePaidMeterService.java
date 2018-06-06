package com.bcits.bfm.service;

import java.util.List;




import com.bcits.bfm.model.PrePaidMeters;

public interface PrePaidMeterService extends GenericService<PrePaidMeters>{

	public List<?> getConsumerIDs();
	public String getPropertyNo(int propertyId);
	public String getBlockName(int blockId);
	public List<?> FindAll();
	public int accountId(int propertyId);
	public List<?> getOwnerName(int personId);
	public List<String> getMeterNumber(int prePaidId);
	public int getPersonId(int propertyId);
	public int getPropertyId(String mtr);
	public long getCANumber(String ca_no);
	public List<String> getAllCaNumbers(int prePaidId);
	public List<String> getMeterNumbers();
	public List<?> getAllProp(int blockId);
	public String getMtrNo(int propid);
	//public List<?> getTentantName(int propertyId,int personId);
	public Object[] getserviceStartDate(int propId);
	public List<?> getPropOnlyforChargesCalcu(int blockId);
	public List<?> getPropForMailBill(int blockId);
	public Object[] getCANumberbymeterNo(String meterNo);
	public long getmetersDetails(int personId, int propertyId);


}
