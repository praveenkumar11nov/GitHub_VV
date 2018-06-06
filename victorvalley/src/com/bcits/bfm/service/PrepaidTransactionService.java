package com.bcits.bfm.service;

import java.util.List;

import com.bcits.bfm.model.PrepaidTxnChargesEntity;

public interface PrepaidTransactionService extends GenericService<PrepaidTxnChargesEntity>{

	
   List<PrepaidTxnChargesEntity> readAllData(int serviceId);
    int getcbId(int serviceId);
    List<PrepaidTxnChargesEntity> getall(int serviceId);
  
}
