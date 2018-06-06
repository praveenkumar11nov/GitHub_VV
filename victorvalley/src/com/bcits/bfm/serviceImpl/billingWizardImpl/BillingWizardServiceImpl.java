package com.bcits.bfm.serviceImpl.billingWizardImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bcits.bfm.model.BillingWizardEntity;
import com.bcits.bfm.service.billingWizard.BillingWizardService;
import com.bcits.bfm.serviceImpl.GenericServiceImpl;

@Repository
public class BillingWizardServiceImpl extends GenericServiceImpl<BillingWizardEntity> implements BillingWizardService  {
	
	@Override
	@SuppressWarnings({ "unchecked" })
	@Transactional(propagation=Propagation.SUPPORTS)
	public List<?> findALL() { 
		List<BillingWizardEntity> list = entityManager.createNamedQuery("BillingWizardEntity.findAll").getResultList();
		
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		 Map<String, Object> paymentMap = null;
		 for (Iterator<?> iterator = list.iterator(); iterator.hasNext();)
			{
				final Object[] values = (Object[]) iterator.next();
				paymentMap = new HashMap<String, Object>();
				
				paymentMap.put("wizardId", (Integer)values[0]);
				paymentMap.put("accountNo", (String)values[1]);
				paymentMap.put("accountId", (Integer)values[2]);
				
				String personName = "";
				personName = personName.concat((String)values[3]);
				if((String)values[4] != null)
				{
					personName = personName.concat(" ");
					personName = personName.concat((String)values[4]);
				}
				
				paymentMap.put("personName", personName);
				paymentMap.put("status", (String)values[5]);
				paymentMap.put("typeOfService", (String)values[6]);
				paymentMap.put("property_No", (String)values[7]);
			
			result.add(paymentMap);
	     }
     return result;
	}
	
	@SuppressWarnings("rawtypes")
	public List getAllDetails(List wizardList){
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		 Map<String, Object> wizardMap = null;
		 
		 for (Iterator<?> iterator = wizardList.iterator(); iterator.hasNext();)
			{
				final Object[] values = (Object[]) iterator.next();
				wizardMap = new HashMap<String, Object>();
								
				wizardMap.put("wizardId", (Integer)values[0]);	
				wizardMap.put("accountNo", (String)values[2]);
				wizardMap.put("accountId", (Integer)values[1]);	
				
				String personName = "";
				personName = personName.concat((String)values[3]);
				if((String)values[4] != null)
				{
					personName = personName.concat(" ");
					personName = personName.concat((String)values[4]);
				}				
				wizardMap.put("personName", personName);
				
				wizardMap.put("status", (String)values[5]);
				wizardMap.put("typeOfService", (String)values[6]);
				/*wizardMap.put("servicePointId", (Integer)values[6]);*/
						
			result.add(wizardMap);
	     }
      return result;
	}
	
	@Override
	@Transactional(propagation=Propagation.SUPPORTS)
	public List<?> findMeterNumbers(String serviceType){
		
		List<?> propertyNumbersList = entityManager.createNamedQuery("BillingWizardEntity.findMeterNumbers").setParameter("serviceType", serviceType).getResultList();
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> propertyNumberMap = null;
		for (Iterator<?> iterator = propertyNumbersList.iterator(); iterator.hasNext();)
			{
				final Object[] values = (Object[]) iterator.next();
				propertyNumberMap = new HashMap<String, Object>();				
								
				propertyNumberMap.put("elMeterId", (Integer)values[0]);	
				propertyNumberMap.put("meterSerialNo",(String)values[1]);			
			
			result.add(propertyNumberMap);
	     }
     return result;
	}

	@Override
	public void approvedAccountNumber(int wizardId, HttpServletResponse response) {
		try
		{
			PrintWriter out = response.getWriter();
			
			List<String> attributesList = new ArrayList<String>();
			attributesList.add("status");

			BillingWizardEntity billingWizardEntity = find(wizardId);
			
			if(billingWizardEntity.getStatus().equals("Created"))
			{
				entityManager.createNamedQuery("BillingWizardEntity.approvedAccountNumberInBillingWizard").setParameter("status", "Approved").setParameter("wizardId", wizardId).executeUpdate();
				entityManager.createNamedQuery("BillingWizardEntity.approvedAccountInAccounts").setParameter("status", "Active").setParameter("accountId", billingWizardEntity.getAccountObj().getAccountId()).executeUpdate();
				
				if(billingWizardEntity.getMetersEntity()!=null){
					entityManager.createNamedQuery("BillingWizardEntity.approvedMeter").setParameter("status", "In Service").setParameter("elMeterId", billingWizardEntity.getMetersEntity().getElMeterId()).executeUpdate();
				}
				//entityManager.createNamedQuery("BillingWizardEntity.approvedServicePoint").setParameter("status", "Active").setParameter("servicePointId", billingWizardEntity.getServicePointEntity().getServicePointId()).executeUpdate();
				entityManager.createNamedQuery("BillingWizardEntity.approvedServiceMaster").setParameter("status", "Active").setParameter("serviceMasterId", billingWizardEntity.getServiceMastersEntity().getServiceMasterId()).executeUpdate();
				entityManager.createNamedQuery("BillingWizardEntity.approvedServiceMasterParameters").setParameter("status", "Active").setParameter("serviceMasterId", billingWizardEntity.getServiceMastersEntity().getServiceMasterId()).executeUpdate();
				out.write("Account is  approved");
			}else {
				out.write("Account already approved");
			}
			
		} 
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}
	
	@Override
	@Transactional(propagation=Propagation.SUPPORTS)
	public List<?> getServiceRouteNames(){
		
		List<?> towerNamesList = entityManager.createNamedQuery("BillingWizardEntity.getServiceRouteNames").getResultList();
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> towerNameMap = null;
		for (Iterator<?> iterator = towerNamesList.iterator(); iterator.hasNext();)
			{
				final Object[] values = (Object[]) iterator.next();
				towerNameMap = new HashMap<String, Object>();				
								
				towerNameMap.put("srId", (Integer)values[0]);
				towerNameMap.put("routeName",(String)values[1]);				
			
			result.add(towerNameMap);
	     }
     return result;
	}
	
	@Override
	@Transactional(propagation=Propagation.SUPPORTS)
	public List<?> findServiceSubRouteNames(){
		
		List<?> propertyNumbersList = entityManager.createNamedQuery("BillingWizardEntity.findServiceSubRouteNames").getResultList();
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> propertyNumberMap = null;
		for (Iterator<?> iterator = propertyNumbersList.iterator(); iterator.hasNext();)
			{
				final Object[] values = (Object[]) iterator.next();
				propertyNumberMap = new HashMap<String, Object>();				
								
				propertyNumberMap.put("srId", (Integer)values[0]);	
				propertyNumberMap.put("subRouteName",(String)values[1]);				
			
			result.add(propertyNumberMap);
	     }
     return result;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Set<String> commonFilterForAccountNumbersUrl() {
		return new HashSet<String>(entityManager.createNamedQuery("BillingWizardEntity.commonFilterForAccountNumbersUrl").getResultList());
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Set<String> commonFilterForPropertyNoUrl() {
		return new HashSet<String>(entityManager.createNamedQuery("BillingWizardEntity.commonFilterForPropertyNoUrl").getResultList());
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> accountCheck(String service, String accountNumber) {
		try{
			return entityManager.createNamedQuery("BillingWizardEntity.accountCheck").setParameter("service", service).setParameter("accountNumber", accountNumber).getResultList();
		}catch(Exception e){
			return null;
		}
	}

	@Override
	public List<?> findPersonForFilters() {
		List<?> details = entityManager.createNamedQuery("BillingWizardEntity.findPersonForFilters").getResultList();
		return details;
	}

	@Override
	public Date getPossessionDate(int wizardId) { 
		try{
			return entityManager.createNamedQuery("BillingWizardEntity.getPossessionDate",Date.class).setParameter("wizardId", wizardId).setMaxResults(1).getSingleResult();
		}catch(Exception e){
			return null;
		}
	}
	
}
