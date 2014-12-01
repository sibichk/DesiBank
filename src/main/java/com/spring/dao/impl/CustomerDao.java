package com.spring.dao.impl;

import java.util.Date;
import java.util.List;

import com.spring.dao.entity.Customer;
import com.spring.dao.entity.CustomerAccountInfo;
import com.spring.dao.entity.CustomerQuestionAnswer;
import com.spring.dao.entity.CustomerTransactionHistory;
import com.spring.dao.entity.PayeeInfo;
import com.spring.dao.entity.SecurityQuestions;
import com.spring.model.CustomerForm;
import com.spring.model.MiniStatementVO;
import com.spring.model.UserSessionVO;

public interface CustomerDao {
	public String persistCustomer(CustomerForm customer);
	public List<CustomerForm> findCustomers();
	public UserSessionVO validateCustomer(String userid, String password);
	public UserSessionVO validateCustomerByUserId(String userid);
	public boolean deleteCustomer(int id);
	public CustomerForm getCustomer(int id);
	public CustomerForm getCustomer(String userid);
	public String updateCustomer(CustomerForm customer);
	public List<CustomerAccountInfo> getAccountDetails(String userid);
	public List<CustomerAccountInfo> getAccount(String accountNum);
	public List<MiniStatementVO> getTransactionDetails(String userid);
	public String addPayee(PayeeInfo payee);
	public List<PayeeInfo> getPayeeList(String userid);
	public String persistCustomerTransaction(CustomerTransactionHistory transaction);
	public List<SecurityQuestions> securityQns();
	public List<SecurityQuestions> securityQns2();
	public CustomerForm getCustomerDetail(String userid);
	public byte[] findPhoto(int id);
	public List<CustomerQuestionAnswer> getSecurityQns(String id);
	public String updatePass(String userid, String password, String qn1,
			String qn2, String ans1, String ans2);
	public List<Customer> retrieveEmail(String userid);
	public List<CustomerTransactionHistory> scheduledTransfer();
	public String scheduledCustomerTransaction(
			CustomerTransactionHistory transaction);
	public String updateScheduledTransaction(
			CustomerTransactionHistory transactionhistory);
}

