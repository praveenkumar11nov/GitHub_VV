package com.bcits.bfm.service;

import java.util.List;

import com.bcits.bfm.model.OldMeterHistoryEntity;

public interface PrepaidMeterHistoryService extends GenericService<OldMeterHistoryEntity>{

	List<OldMeterHistoryEntity> testUniqueCaNo();

	OldMeterHistoryEntity getSingleData(String ca_No);

	List<?> findmeterHtryDetails();

}
