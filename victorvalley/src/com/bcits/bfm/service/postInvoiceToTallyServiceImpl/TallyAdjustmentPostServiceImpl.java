package com.bcits.bfm.service.postInvoiceToTallyServiceImpl;

import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bcits.bfm.service.billingCollectionManagement.AdjustmentService;
import com.bcits.bfm.service.postInvoiceToTallyService.TallyAdjustmentPostService;
import com.tally.adjustment.TallyAdjustmentPost;



@Service
public class TallyAdjustmentPostServiceImpl implements TallyAdjustmentPostService {
	
	@Autowired
	private AdjustmentService adjustmentService; 

	@Override
	public String reponsePostAdjustmentToTally(int adjustmentId)
			throws Exception {

		String tallyPortNumber=ResourceBundle.getBundle("application").getString("tallyPortNo");
		String tallyIpAddress=ResourceBundle.getBundle("application").getString("tallyIPAddress");
		String tallyUserName=ResourceBundle.getBundle("application").getString("tallyUserName");
		String tallyPassword=ResourceBundle.getBundle("application").getString("tallyPassword");
		String tallyCompanyName=ResourceBundle.getBundle("application").getString("tallyCompanyName");
		
		String autoIncrementString = this.getNewString(adjustmentId);
		String remoteId = "c9acc1de-7922-4396-8128-25ee27f99c92-0"+autoIncrementString+"0";
		String voucherKey = "c9acc1de-7922-4396-8128-25ee27f99c92-0000a44f:0"+autoIncrementString+"0";
		List<Map<String,Object>> adjustmentDetails=adjustmentService.getTallyAdjustmentDetailData(adjustmentId);
		
		TallyAdjustmentPost tallyadjustmentPost=new TallyAdjustmentPost();
		String response=tallyadjustmentPost.createAdjustment(adjustmentDetails, remoteId, voucherKey, adjustmentId, tallyPortNumber, tallyIpAddress, tallyUserName, tallyPassword, tallyCompanyName);
		System.out.println("========================response"+response);
		
		
		
		return response;
	}
	
	  
	
	
	private String getNewString(int invoiceId) {
			
			StringBuilder sb = new StringBuilder();
				sb.append("");
				sb.append(invoiceId);
			String autoIncrementString = sb.toString();
			
			 return autoIncrementString;
		}

}
