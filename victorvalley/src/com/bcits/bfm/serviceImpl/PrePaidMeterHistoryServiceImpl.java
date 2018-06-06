package com.bcits.bfm.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.bcits.bfm.model.OldMeterHistoryEntity;
import com.bcits.bfm.service.PrepaidMeterHistoryService;

@Repository
public class PrePaidMeterHistoryServiceImpl extends GenericServiceImpl<OldMeterHistoryEntity> implements PrepaidMeterHistoryService {

	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<OldMeterHistoryEntity> testUniqueCaNo() {
		
		return entityManager.createNamedQuery("OldMeterHistoryEntity.testUniqueCaNo").getResultList();		
	}

	@Override
	public OldMeterHistoryEntity getSingleData(String ca_No) {
		// TODO Auto-generated method stub
		try{
		return (OldMeterHistoryEntity) entityManager.createNamedQuery("OldMeterHistoryEntity.getSingleData").setParameter("ca_No", ca_No).getSingleResult();
	}catch(Exception e){
	return null;
	}
		
	}

	
	
@SuppressWarnings("unchecked")
	@Override
	public List<?> findmeterHtryDetails() {
		
		List<Map<String, Object>> resultList=new ArrayList<>();
		Map<String, Object> map=null;
		List<?> reHistoryEntities=entityManager.createNamedQuery("OldMeterHistoryEntity.getOldMeterData").getResultList();
		System.out.println("reHistoryEntities="+reHistoryEntities);
		
		for (Iterator iterator = reHistoryEntities.iterator(); iterator.hasNext();) {
			Object[] object = (Object[]) iterator.next();
			map=new HashMap<>();
			map.put("hid", object[0]);
			map.put("ca_no", object[1]);
			map.put("propertyName", object[2]);
			map.put("personName", object[3]);
			map.put("meterNumber", object[4]);
			map.put("balance", object[5]);
			map.put("initial",object[6]);
			map.put("final", object[7]);
			map.put("serviceStartDate", new SimpleDateFormat("dd-MM-yyyy").format(object[8]));
			map.put("serviceEndDate", new SimpleDateFormat("dd-MM-yyyy").format(object[9]));
			resultList.add(map);
		
		}
	/*	for (Object oldMeterHistoryEntity : reHistoryEntities) 
		{
			map=new HashMap<>();
			map.put("hid", oldMeterHistoryEntity.getHid());
			map.put("ca_no", oldMeterHistoryEntity.getCa_no());
			map.put("propertyName", oldMeterHistoryEntity.getPropertyNo());
			map.put("personName", oldMeterHistoryEntity.getPersonName());
			map.put("meterNumber", oldMeterHistoryEntity.getMeterNumber());
			map.put("balance", oldMeterHistoryEntity.getBalance());
			map.put("initial", oldMeterHistoryEntity.getInitailReading());
			map.put("final", oldMeterHistoryEntity.getDgReading());
			map.put("serviceStartDate", new SimpleDateFormat("dd-MM-yyyy").format(oldMeterHistoryEntity.getServiceStartDate()));
			map.put("serviceEndDate", new SimpleDateFormat("dd-MM-yyyy").format(oldMeterHistoryEntity.getServiceEndDate()));
			
			resultList.add(map);
		}*/
		return resultList;
	}

}
