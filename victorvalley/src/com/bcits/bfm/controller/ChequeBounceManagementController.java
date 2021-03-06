package com.bcits.bfm.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.bcits.bfm.model.ChequeBounceEntity;
import com.bcits.bfm.model.PaymentSegmentsEntity;
import com.bcits.bfm.service.billingCollectionManagement.ChequeBounceService;
import com.bcits.bfm.service.billingCollectionManagement.PaymentService;
import com.bcits.bfm.util.DateTimeCalender;
import com.bcits.bfm.util.JsonResponse;
import com.bcits.bfm.view.BreadCrumbTreeService;

/**
 * Controller which includes all the business logic concerned to this module's Use case
 * Module: Cheque Bounce
 * Use Case : Payments
 * 
 * @author Ravi Shankar Reddy
 * @version %I%, %G%
 * @since 0.1
 */

@Controller
public class ChequeBounceManagementController {

	static Logger logger = LoggerFactory.getLogger(ChequeBounceManagementController.class);

	DateTimeCalender dateTimeCalender = new DateTimeCalender();
	
	@Autowired
	private BreadCrumbTreeService breadCrumbService;
	
	@Autowired
	private Validator validator;
	
	@Autowired
	private ChequeBounceService chequeBounceService;
	
	@Autowired
	private PaymentService paymentService;
	
	@PersistenceContext(unitName="bfm")
	protected EntityManager entityManager;
	
	@RequestMapping("/chequeBounce")
	public String chequeBounce(HttpServletRequest request, Model model) {
		
		logger.info("In Cheque bounce method");
		model.addAttribute("ViewName", "Cheque bounce");	
		breadCrumbService.addNode("nodeID", 0, request);
		breadCrumbService.addNode("Cash Management", 1, request);
		breadCrumbService.addNode("Cheque bounce", 2, request);
		
		return "billingPayments/chequeBounce";
	}
	
	// ****************************** Cheque Bounce Read,Create,Delete methods ********************************//
	   
   	@RequestMapping(value = "/chequeBounce/chequeBouncetRead", method = {RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<?> chequeBouncetRead() {
		logger.info("In read cheque bounce method");
		List<?> bounceEntities = chequeBounceService.findAll();
		return bounceEntities;
	}

	@RequestMapping(value = "/chequeBounce/chequeBounceCreate", method = {RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody Object chequeBounceCreate(@ModelAttribute("chequeBounceEntity") ChequeBounceEntity chequeBounceEntity,BindingResult bindingResult,ModelMap model, HttpServletRequest req,SessionStatus sessionStatus, final Locale locale) throws Exception 
	{

		logger.info("***********************In save cheque bounce details method***********************");
		String chekDate="SELECT bp.INSTRUMENT_DATE "
				+ "FROM PAYMENTS bp,ACCOUNT_VV a "
				+ "WHERE a.ACCOUNT_ID=bp.ACCOUNT_ID AND bp.CP_PAYMENT_MODE='Cheque' AND bp.INSTRUMENT_NO='"+chequeBounceEntity.getChequeNo()+"' "
				+ "AND bp.CP_RECEIPT_NO='"+chequeBounceEntity.getReceiptNo()+"' AND bp.status='Posted' "
				+ "AND bp.BANK_ID='"+chequeBounceEntity.getBankName()+"'";
		String CHKDATE = entityManager.createNativeQuery(chekDate).getSingleResult().toString();
		System.err.println("chkdate="+CHKDATE);
		java.sql.Date savechkdate = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(CHKDATE).getTime());
		
		int accountNo=Integer.parseInt(req.getParameter("accountNo"));
		chequeBounceEntity.setAccountId(accountNo);
		chequeBounceEntity.setStatus("Created");
		chequeBounceEntity.setChequeGivenDate(savechkdate);
		//chequeBounceEntity.setChequeGivenDate(dateTimeCalender.getDateToStore(req.getParameter("chequeGivenDate")));
		chequeBounceEntity.setBouncedDate(dateTimeCalender.getDateToStore(req.getParameter("bouncedDate")));
		chequeBounceEntity.setAmountValid("No");
		
		List<Integer> paymentList = chequeBounceService.getPaymentIdBasedOnChequeBounce(chequeBounceEntity);
		
		if(!paymentList.isEmpty()){
			
			List<PaymentSegmentsEntity> segmentsList = paymentService.getPaymentSegmentsList(paymentList.get(0));
			
			for (PaymentSegmentsEntity paymentSegmentsEntity : segmentsList) {
				
				if(paymentSegmentsEntity.getBillSegment().equalsIgnoreCase("Late Payment")){
					chequeBounceEntity.setPreviousLateAmount(paymentSegmentsEntity.getAmount());
				}
			}
		}	
		
		validator.validate(chequeBounceEntity, bindingResult);
		chequeBounceService.save(chequeBounceEntity);
		sessionStatus.setComplete();
		return chequeBounceEntity;
	}
	
	@RequestMapping(value = "/chequeBounce/chequeBounceUpdate", method = RequestMethod.GET)
	public @ResponseBody Object chequeBounceUpdate(@ModelAttribute("chequeBounceEntity") ChequeBounceEntity chequeBounceEntity,BindingResult bindingResult, ModelMap model,SessionStatus sessionStatus, final Locale locale,HttpServletRequest req) throws ParseException 
	{

		logger.info("In edit cheque bounce details method");
		chequeBounceEntity.setChequeGivenDate(dateTimeCalender.getDateToStore(req.getParameter("chequeGivenDate")));
		chequeBounceEntity.setBouncedDate(dateTimeCalender.getDateToStore(req.getParameter("bouncedDate")));
		
		validator.validate(chequeBounceEntity, bindingResult);
		chequeBounceService.update(chequeBounceEntity);
		
		return chequeBounceEntity;
	}

	@RequestMapping(value = "/chequeBounce/chequeBounceDestroy", method = RequestMethod.GET)
	public @ResponseBody Object deleteAdjustmentsDetsails(@ModelAttribute("chequeBounceEntity") ChequeBounceEntity chequeBounceEntity,BindingResult bindingResult, ModelMap model, SessionStatus ss,HttpServletRequest req) {
		
		logger.info("In delete cheque bounce details method");
		JsonResponse errorResponse = new JsonResponse();
		
		try {
			chequeBounceService.delete(chequeBounceEntity.getChequeBounceId());
		} catch (Exception e) {
			errorResponse.setStatus("CHILD");
			return errorResponse;
		}
		ss.setComplete();
		return chequeBounceEntity;
	}
	
	@RequestMapping(value = "/chequeBounce/changeStatus/{chequeBounceId}", method = {RequestMethod.GET, RequestMethod.POST })
	public void changeChequeBounceStatus(@PathVariable int chequeBounceId,HttpServletResponse response) {
		synchronized (this) {
			chequeBounceService.changeChequeBounceStatus(chequeBounceId,response);	
		}
	}
	
	@RequestMapping(value = "/chequeBounce/getAllReceiptNos/{accountId}", method = RequestMethod.GET)
	public @ResponseBody List<?> getAllReceiptNos(@PathVariable int accountId){
		
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>(); 
		List<String> receiptNoList = chequeBounceService.getAllReceiptNos(accountId);
		Map<String, Object> codeMap = null;
		for (String receptNo : receiptNoList)
		{
			codeMap = new HashMap<String, Object>();
			codeMap.put("receiptNo", receptNo);
 	       	result.add(codeMap);
 	     }
        return result;
	}
	
	@RequestMapping(value = "/billingPayments/getChequeDetailsBasedOnChequeNumber/{chequeNo}/{bankName}/{receiptNo}", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<?> getChequeDetailsBasedOnChequeNumber(@PathVariable String chequeNo,@PathVariable String bankName,@PathVariable String receiptNo) {

		 List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		 Map<String, Object> chequeMap = null;
		 for (Iterator<?> iterator = chequeBounceService.getChequeDetailsBasedOnChequeNumber(chequeNo,bankName,receiptNo).iterator(); iterator.hasNext();)
			{
				final Object[] values = (Object[]) iterator.next();
				chequeMap = new HashMap<String, Object>();
				
				chequeMap.put("accountId", (Integer)values[0]);
				chequeMap.put("accountNo", (String)values[1]);
				chequeMap.put("instrumentDate", (Date)values[2]);
				chequeMap.put("paymentAmount", (Double)values[3]);
				chequeMap.put("receiptNo", (String)values[4]);
				
			    result.add(chequeMap);
	     }
		 return result;
	}
	
}
