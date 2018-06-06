package com.bcits.bfm.service.accountsManagement;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

import com.bcits.bfm.model.Account;
import com.bcits.bfm.service.GenericService;

@Component
public interface AccountService extends GenericService<Account>
{

	List<Account> findAllAccounts(int personId);

	void setAccountStatus(int accountId, String operation,
			HttpServletResponse response);

	List<Account> findAllPersons();

	void updateAccountStatusFromInnerGrid(int accountId,
			HttpServletResponse response);

	List<?> getAccountNumber(int personId,int propertyId);

	int autoGeneratedAccountNumber();

	List<Account> testUniqueAccount1(int personId,int propertyId);
	
	public List<Account> testUniqueAccount(String accountNo,int propertyId);

	List<?> findPersonForFilters();

	int getAccountIdByNo(String accountNo);

	Integer findAccountNumberBasedOnId(int propid);
	

}