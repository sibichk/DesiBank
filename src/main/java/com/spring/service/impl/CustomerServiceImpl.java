package com.spring.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.entity.Customer;
import com.spring.dao.entity.CustomerAccountInfo;
import com.spring.dao.entity.CustomerQuestionAnswer;
import com.spring.dao.entity.CustomerTransactionHistory;
import com.spring.dao.entity.PayeeInfo;
import com.spring.dao.entity.SecurityQuestions;
import com.spring.dao.impl.CustomerDao;
import com.spring.model.CustomerForm;
import com.spring.model.MiniStatementVO;
import com.spring.model.Password;
import com.spring.model.UserSessionVO;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerDao customerDao;
	
	@Override
	public UserSessionVO validateCustomerByUserId(String userid) {
		return customerDao.validateCustomerByUserId(userid);
	}
	
	@Override
	public String persistCustomer(CustomerForm customer) {
		return customerDao.persistCustomer(customer);
	}

	@Override
	public List<CustomerForm> findCustomers() {
		return customerDao.findCustomers();
	}

	@Override
	public UserSessionVO validateCustomer(String userid, String password) {
		return customerDao.validateCustomer(userid,password);
	}

	@Override
	public boolean deleteCustomer(int id) {
		return customerDao.deleteCustomer(id);
	}

	@Override
	public CustomerForm getCustomer(int id) {
		return customerDao.getCustomer(id);
	}

	@Override
	public CustomerForm getCustomer(String userid) {
		return customerDao.getCustomer(userid);
	}

	@Override
	public String updateCustomer(CustomerForm customer) {
		return customerDao.updateCustomer(customer);
	}

	@Override
	public List<CustomerAccountInfo> getAccountDetails(String userid) {
		return  customerDao.getAccountDetails(userid);
	}

	@Override
	public List<CustomerAccountInfo> getAccount(String accountNum) {
		return customerDao.getAccount(accountNum);
	}

	@Override
	public List<MiniStatementVO> getTransactionDetails(String userid) {
		return customerDao.getTransactionDetails(userid);
	}

	@Override
	public String addPayee(PayeeInfo payee) {
		return customerDao.addPayee(payee);
	}

	@Override
	public List<PayeeInfo> getPayeeList(String userid) {
		return customerDao.getPayeeList(userid);
	}

	@Override
	public String persistCustomerTransaction(
			CustomerTransactionHistory transaction) {
		return customerDao.persistCustomerTransaction(transaction);
	}

	@Override
	public List<SecurityQuestions> securityQns() {
		List<SecurityQuestions> sqList = (List<SecurityQuestions>)customerDao.securityQns();
		return sqList;
	}
	
	@Override
	public List<SecurityQuestions> securityQns2() {
		List<SecurityQuestions> sqList = (List<SecurityQuestions>)customerDao.securityQns2();
		return sqList;
	}
	
	@Override
	public CustomerForm getUserDetail(String userid){
		CustomerForm detail = (CustomerForm)customerDao.getCustomerDetail(userid);
		return detail;
	}

	@Override
	public byte[] findPhotoById(int id) {
		// TODO Auto-generated method stub
		byte[] photo = customerDao.findPhoto(id);
		return photo;
	}

	@Override
	public List<CustomerQuestionAnswer> getSecurityQn(String id) {
		// TODO Auto-generated method stub
		List<CustomerQuestionAnswer> qns = (List<CustomerQuestionAnswer>)customerDao.getSecurityQns(id);
		return qns;
	}

	@Override
	public String checkPassword(String userid, String password, String qn1,
			String qn2, String ans1, String ans2) {
			
			String  updatePass =  (String) customerDao.updatePass(userid, password, qn1,
					 qn2, ans1, ans2);
		
		return updatePass;
	}

	@Override
	public List<Customer> retrieveEmail(String userid) {
		List<Customer> email= customerDao.retrieveEmail(userid);
		return email;
		
	}

	@Override
	public List<CustomerTransactionHistory> scheduledTransfer() {
		return customerDao.scheduledTransfer();
		
	}
	
	
}
