package com.bcits.bfm.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bcits.bfm.model.SmsEmailForLowBal;
import com.bcits.bfm.service.LowBalanceStoreService;

@Repository
public class LowBalanceStoreServiceImpl extends GenericServiceImpl<SmsEmailForLowBal> implements LowBalanceStoreService{

	@SuppressWarnings("unchecked")
	@Override
	public List<SmsEmailForLowBal> getAllData(String caNo, int nooftimesRec) {
	       try{
	    	   //System.out.println("in side1");
	    	   return entityManager.createNamedQuery("SmsEmailForLowBal.lowBal1").setParameter("ca_num", caNo).setParameter("rechargedStatus", nooftimesRec).getResultList();
	       }catch(Exception e){
	    	   e.printStackTrace();
	       }
		return null;
	}
    
	@SuppressWarnings("unchecked")
	@Override
	public List<SmsEmailForLowBal> getAllData1(String caNo, int nooftimesRec) {
	       try{
	    	   //System.out.println("in side2");
	    	   return entityManager.createNamedQuery("SmsEmailForLowBal.lowBal2").setParameter("ca_num", caNo).setParameter("rechargedStatus", nooftimesRec).getResultList();
	       }catch(Exception e){
	    	   e.printStackTrace();
	       }
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SmsEmailForLowBal> getAllData2(String caNo, int nooftimesRec) {
	       try{
	    	  // System.out.println("in side3");
	    	   return entityManager.createNamedQuery("SmsEmailForLowBal.lowBal3").setParameter("ca_num", caNo).setParameter("rechargedStatus", nooftimesRec).getResultList();
	       }catch(Exception e){
	    	   e.printStackTrace();
	       }
		return null;
	}

	@Override
	public int getEstateManager() {
		try{
			return (int) entityManager.createNamedQuery("SmsEmailForLowBal.EstateManager").getSingleResult();
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<SmsEmailForLowBal> getAllDatalowbalance(String caNum,
			String RECHARGED_AMT_WEB) {
		  try{
	    	   //System.out.println("in side1");
	    	   return entityManager.createNamedQuery("SmsEmailForLowBal.lowBalhourly").setParameter("ca_num", caNum).setParameter("RECHARGED_AMT_WEB", RECHARGED_AMT_WEB).getResultList();
	       }catch(Exception e){
	    	   e.printStackTrace();
	       }
		return null;
	}

	@Override
	public List<SmsEmailForLowBal> getAllDatahourly(String caNum,
			String RECHARGED_AMT_WEB) {
		try{
	    	   //System.out.println("in side2");
	    	   return entityManager.createNamedQuery("SmsEmailForLowBal.lowBal2hourly").setParameter("ca_num", caNum).setParameter("RECHARGED_AMT_WEB", RECHARGED_AMT_WEB).getResultList();
	       }catch(Exception e){
	    	   e.printStackTrace();
	       }
		return null;
	}

	@Override
	public List<SmsEmailForLowBal> getAllDatahourly1(String caNum,
			String RECHARGED_AMT_WEB) {
		  try{
	    	  // System.out.println("in side3");
	    	   return entityManager.createNamedQuery("SmsEmailForLowBal.lowBal3hourly").setParameter("ca_num", caNum).setParameter("RECHARGED_AMT_WEB", RECHARGED_AMT_WEB).getResultList();
	       }catch(Exception e){
	    	   e.printStackTrace();
	       }
		return null;
	}

	
	
	/*@Override
	public List<?> getHourlyLowBalanceStatus() {
		try{
			return entityManager.createNamedQuery("SmsEmailForLowBal.lowBalanceStatusHourly").getResultList();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}*/

}
