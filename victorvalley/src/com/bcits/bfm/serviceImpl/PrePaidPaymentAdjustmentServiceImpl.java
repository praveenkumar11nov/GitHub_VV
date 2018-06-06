package com.bcits.bfm.serviceImpl;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.bcits.bfm.model.PrePaidPaymentEntity;
import com.bcits.bfm.service.PrepaidPaymentAdjustmentService;

@Repository
public class PrePaidPaymentAdjustmentServiceImpl extends GenericServiceImpl<PrePaidPaymentEntity> implements PrepaidPaymentAdjustmentService{

	@Override
	public List<?> ReadPropertys() {
		try{
			return entityManager.createNamedQuery("PrePaidPaymentEntity.getPropertyNum").getResultList();
		}catch(Exception e){
			e.printStackTrace();
		}
	return null;
	}

	@Override
	public List<?> readMeters() {
		try{
			return entityManager.createNamedQuery("PrePaidPaymentEntity.getMeterNum").getResultList();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<?> getAllData() {
		try{
			System.out.println("1");
			return readAllData(entityManager.createNamedQuery("PrePaidPaymentEntity.getAll").getResultList());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
   
	 @SuppressWarnings("rawtypes")
	public List readAllData(List<?> adjustmentlist){
		 List<Map<String, Object>> resultList=new ArrayList<>();
		 
		 Map<String, Object> mapList=null;
		 for(Iterator<?> iterator=adjustmentlist.iterator();iterator.hasNext();){
			 System.out.println("2");
			 final Object[] value=(Object[]) iterator.next();
			 mapList=new HashMap<>();
			 mapList.put("adjustmentId", value[0]);
			 mapList.put("consumerId", value[1]);
			 if(value[2]!=null){
				
				 List<?> qList=entityManager.createQuery("select p.firstName,p.lastName from Person p,PrePaidMeters pp where p.personId=pp.personId AND pp.propertyId ="+Integer.parseInt(value[2].toString())+"").getResultList();
				    for(Iterator<?> iterator2=qList.iterator();iterator2.hasNext();){
				    	final Object[] vaObjects=(Object[]) iterator2.next();
				    	System.out.println("personName"+ vaObjects[0]+""+vaObjects[1]);
				    	 mapList.put("personName", vaObjects[0]+""+vaObjects[1]);
				    }
				String   s1=(String) entityManager.createQuery("select pt.property_No from Property pt where pt.propertyId = "+Integer.parseInt(value[2].toString())+"").getSingleResult();
			 mapList.put("property_No",s1 );
			 }
			 if(value[3]!=null){
				 DateFormat dateFormat=new SimpleDateFormat("dd-MM-yyyy");
				 System.out.println(dateFormat);
			 mapList.put("adjustmentDate", (Date)value[3]);
			 }
			 mapList.put("adjustmentNo", value[4]);
			 mapList.put("paymentMode", value[6]);
			 mapList.put("adjustmentAmount", value[5]);
			 mapList.put("remarks", value[8]);
			 mapList.put("status", value[7]);
			 mapList.put("instrumentDate", value[9]);
			 mapList.put("instrumentNo", value[10]);
			 mapList.put("bankName", value[11]);
			 mapList.put("ca_No", value[12]);
			 resultList.add(mapList);
		 }
		 
		 return resultList;
	 }

	@Override
	public String getCaNumber(int propertyId) {
	  try{
		  return (String) entityManager.createNamedQuery("PrePaidPaymentEntity.getCaNumbers").setParameter("propertyId", propertyId).getSingleResult();
	  }catch(Exception e){
		  e.printStackTrace();
	  }
		return null;
	}

	@Override
	public List<?> searchByDate(java.util.Date fromDate, java.util.Date toDate) {
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		String frDate=dateFormat.format(fromDate);
		String tDate=dateFormat.format(toDate);
		System.out.println(frDate+"**********  "+tDate);
		try{
			return readAllData(entityManager.createNamedQuery("PrePaidPaymentEntity.searchByMonth").setParameter("fromDate", frDate).setParameter("toDate", tDate).getResultList());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	/*---------------------------------- Generate XML for Tally --------------------------------------*/
	
	@Override
	public Object[] getInstrumentIDNo(String receiptNumber) {
		try{
			return (Object[]) entityManager.createNamedQuery("PrePaidPaymentEntity.getInstrumentDetails").setParameter("receiptNumber", receiptNumber).getSingleResult();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
}
