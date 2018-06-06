package com.bcits.bfm.serviceImpl;

import java.sql.Timestamp;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.core.SimpleAliasRegistry;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bcits.bfm.model.PrepaidRechargeEntity;
import com.bcits.bfm.service.PrepaidRechargeService;


@Repository
public class PrepaidRechargeServiceImpl extends GenericServiceImpl<PrepaidRechargeEntity> implements PrepaidRechargeService {

	@Override
	public List<?> getpersonDetails(Integer propertyId) {
		// TODO Auto-generated method stub
		List<?> personDetails=entityManager.createNamedQuery("ElectricityMetersEntity.getPersonDetails").setParameter("propertyId", propertyId).getResultList();
		
		Iterator itr=personDetails.iterator();
		/**/
		
		 List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		 Map<String, Object> meterMap = null;
		 for (Iterator<?> iterator = personDetails.iterator(); iterator.hasNext();)
			{
				final Object[] values = (Object[]) iterator.next();
				meterMap = new HashMap<String, Object>();
				//SELECT DISTINCT(p.personId), p.firstName, p.lastName, p.personType, p.personStyle,em.meterSerialNo,a.accountId,a.accountNo  FROM ElectricityMetersEntity em INNER JOIN em.account a INNER JOIN a.person p where a.propertyId=:propertyId			
				String personName="";
				meterMap.put("elMeterId", (Integer)values[0]);	
				meterMap.put("firstName",(String)values[1]);
				if(((String)values[2])!= null){
					personName=	(String)values[1]+" "+(String)values[2];
				}else{
					personName=	(String)values[1];
				}
				
				meterMap.put("meterSerialNo", (String)values[5]);	
				meterMap.put("accountId", (Integer)values[6]);
				meterMap.put("accountNo", (String)values[7]);
			    result.add(meterMap);
	     }
      return result;
		
	}

	@Override
	public String getMeterSerialNo(String propertyId) {
		try{
			System.out.println("1");
		return (String)entityManager.createNamedQuery("PrepaidRechargeEntity.getMeterSerialNo").setParameter("propertyId", propertyId).getSingleResult();
		}catch(Exception e){e.printStackTrace();}
		
		return null;
		
	}

	@Override
	public int getAccountId(Integer propertyId) {
		System.out.println("1");
		try{
		return (int) entityManager.createQuery("select a.accountId  from Account a Where a.propertyId ='"+propertyId+"'").getSingleResult();
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<?> findall(Integer accountId) {
		try{
		return getPrepaidData(entityManager.createNamedQuery("PrepaidRechargeEntity.findALL").setParameter("accountId", accountId).getResultList());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("rawtypes")
	public List getPrepaidData(List<?> prepaidRechargeEntity){
		List<Map<String,Object>> resultList=new ArrayList<>();
		Map<String, Object> list=null;
		for(Iterator<?> iterator=prepaidRechargeEntity.iterator();iterator.hasNext();){
			
			final Object[] values=(Object[]) iterator.next();
			list=new HashMap<>();
			list.put("preRechargeId", values[0]);
			list.put("meterSerialNo", values[11]);
			list.put("meterNumber", values[11]);
			list.put("cName", values[8]);
			list.put("fName", values[9]);
			list.put("paymentMode", values[4]);
			list.put("rechargeAmount", values[1]);
			list.put("tokenNo", values[2]);
			list.put("parentStatus", values[12]);
			if(values[7]!=null){
			String s=new SimpleDateFormat("MM-dd-yyyy").format((Timestamp)values[7]);
			System.out.println(s);
			list.put("txnDate", s);
			}
			if(values[13]!=null){
				String s=new SimpleDateFormat("MM-dd-yyyy").format((Timestamp)values[13]);
				System.out.println(s);
				list.put("billDate", s);
				}
			//list.put("billDate", new Date());
			list.put("txnId", values[6]);
			list.put("typeOfService", values[10]);
			
			resultList.add(list);
		}
		return resultList;
	}

	@Override
	public int getIdBasedOnTxnId(String txnId) {
	   try{
		return (int) entityManager.createNamedQuery("PrepaidRechargeEntity.getIDBasedOnTxnId").setParameter("txn_ID", txnId).getSingleResult();
	   }catch(Exception e){
		   e.printStackTrace();
	   }
	   return 0;
    }

	@Override
	public List<PrepaidRechargeEntity> getDataByaccountId(int accountId) {
		try{
			return entityManager.createNamedQuery("PrepaidRechargeEntity.currentConsumption").setParameter("accountId", accountId).getResultList();
		}catch(Exception e){
			e.printStackTrace();
			}
		return null;
	}

	@Override
	public List<PrepaidRechargeEntity> getPaymentHistory() {
         try{
        	return entityManager.createNamedQuery("PrepaidRechargeEntity.readDataForPaymentHtry").getResultList();
         }catch(Exception e){
        	 e.printStackTrace();
         }
		return null;
	}

	@Override
	public List<PrepaidRechargeEntity> getPaymentHistoryByMonth(Date fromdate, Date todate) {
		Format format=new SimpleDateFormat("yyyy-MM-dd");
		String fromDate=format.format(fromdate);
		String toDate=format.format(todate);
		try{
			return entityManager.createNamedQuery("PrepaidRechargeEntity.getPaymentHistoryByDate").setParameter("fromDate", fromDate).setParameter("toDate", toDate).getResultList();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
/*--------------------------------    Generate XML for Tally------------------------------------------*/
	@SuppressWarnings("unchecked")
	@Override
	public List<PrepaidRechargeEntity> getAllRecords(Date fromMonth) {
		Calendar  cal=Calendar.getInstance();
		cal.setTime(fromMonth);
		int m1=cal.get(Calendar.MONTH);
		int month=m1+1;
		int year=cal.get(Calendar.YEAR);
		try{
			System.err.println("***********in sdie if");
			return entityManager.createNamedQuery("PrepaidRechargeEntity.getAllRecordForTally").setParameter("month", month).setParameter("year", year).getResultList();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void upDateTallyStatus(int ppRechargeId,String tallyStatus) {
		try{
			entityManager.createNamedQuery("PrepaidRechargeEntity.updateTallyStatus").setParameter("tallyStatus", tallyStatus).setParameter("preRechargeId", ppRechargeId).executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PrepaidRechargeEntity> getFiftyRecords(Date fromDate) {
		Calendar cal=Calendar.getInstance();
		cal.setTime(fromDate);
		int m1=cal.get(Calendar.MONTH);
		int month=m1+1;
		int year=cal.get(Calendar.YEAR);
	   try{
		return entityManager.createNamedQuery("PrepaidRechargeEntity.getAllRecordForTally").setParameter("month", month).setParameter("year", year).setMaxResults(50).getResultList();
	    }catch(Exception e){
	    	System.err.println("Exception Occured");
		e.printStackTrace();
	    }
		return null;
	}

   
}
