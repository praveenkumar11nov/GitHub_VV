package com.bcits.bfm.service;

import java.util.Date;
import java.util.List;

import com.bcits.bfm.model.PrePaidPaymentEntity;

public interface PrepaidPaymentAdjustmentService extends GenericService<PrePaidPaymentEntity> {
	
	public List<?> ReadPropertys();
	public List<?> readMeters();
    public List<?> getAllData();
    public String getCaNumber(int propertyId);
    public List<?> searchByDate(Date fromDate,Date toDate);
    
	public Object[] getInstrumentIDNo(String receiptNumber);
}
