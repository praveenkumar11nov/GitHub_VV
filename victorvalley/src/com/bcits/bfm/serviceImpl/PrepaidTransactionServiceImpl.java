package com.bcits.bfm.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.bcits.bfm.model.PrepaidTxnChargesEntity;
import com.bcits.bfm.service.PrepaidTransactionService;

@Repository
public class PrepaidTransactionServiceImpl extends GenericServiceImpl<PrepaidTxnChargesEntity> implements PrepaidTransactionService{

	@SuppressWarnings("unchecked")
	@Override
	public List<PrepaidTxnChargesEntity> readAllData(int serviceId) {
	    try{
	    	return getData(entityManager.createNamedQuery("PrepaidTxnChargesEntity.getData").setParameter("serviceId", serviceId).getResultList());
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
		return null;
	}

	@SuppressWarnings("rawtypes")
	public List getData(List<PrepaidTxnChargesEntity> prEntities){
		List<Map<String, Object>> resultList=new ArrayList<>();
		Map<String, Object> mapList=null;
		SimpleDateFormat dateFormat=new SimpleDateFormat("MM/dd/yyyy");
		for(PrepaidTxnChargesEntity prChargesEntity:prEntities){
			mapList=new HashMap<>();
			mapList.put("transactionId", prChargesEntity.getTransactionId());
		    String query=(String) entityManager.createQuery("select p.service_Name from PrepaidServiceMaster p where p.serviceId ="+prChargesEntity.getSid()).getSingleResult();
			mapList.put("service_Name", query);
			mapList.put("charge_Name", prChargesEntity.getCharge_Name());
			mapList.put("rate", prChargesEntity.getRate());
		/*	mapList.put("fromDate",dateFormat.format((Date)prChargesEntity.getFromDate()));
			mapList.put("toDate", dateFormat.format((Date)prChargesEntity.getToDate()));*/
			String cbName=(String) entityManager.createQuery("select pc.cbName from PrepaidCalculationBasisEntity pc where pc.cid="+prChargesEntity.getcId()).getSingleResult();
			mapList.put("cbname",cbName);
			mapList.put("charge_Type", prChargesEntity.getCharge_Type());
			mapList.put("serviceId", prChargesEntity.getSid());
			resultList.add(mapList);
		}
		System.out.println("resulitList "+resultList);
		return resultList;
	}

	@Override
	public int getcbId(int serviceId) {
		try{
		 return (int) entityManager.createNamedQuery("PrepaidTxnChargesEntity.getcbId").setParameter("serviceId", serviceId).getSingleResult();
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<PrepaidTxnChargesEntity> getall(int serviceId) {
		 try{
		    	return entityManager.createNamedQuery("PrepaidTxnChargesEntity.getData").setParameter("serviceId", serviceId).getResultList();
		    }catch(Exception e){
		    	e.printStackTrace();
		    }
		return null;
	}
}
