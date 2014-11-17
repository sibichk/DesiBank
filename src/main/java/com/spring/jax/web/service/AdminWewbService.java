package com.spring.jax.web.service;

import java.util.List;

import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.spring.model.CustomerForm;
import com.spring.model.CustomerFormList;
import com.spring.util.Encrypter;
import com.spring.util.IdList;
import com.spring.web.service.exception.AuthenticateMessageException;
@WebService(endpointInterface="com.spring.jax.web.service.AdminService",
serviceName="adminWebService")
@Component
@Qualifier("adminWebService")
public class AdminWewbService implements AdminService {

	@Autowired
	@Qualifier("adminServiceImpl")
	public com.spring.service.impl.AdminService adminService;
	
	@Autowired
	@Qualifier("customerServiceImpl")
	public com.spring.service.impl.CustomerService customerService;
	@Override
	public CustomerFormList listUnapprovedCustomers() {
		List<CustomerForm> customerForms = adminService.listUnapprovedCustomers();
		CustomerFormList customerFormList = new CustomerFormList();
		customerFormList.setCustomerFormList(customerForms);
		return customerFormList;
	}

	@Override
	public String approveCustomers(IdList id) {
		List<String> id1 = id.getIdList();
		String[] id2 = new String[20];
		for(int i=0;i<id1.size();i++)
		{
			id2[i]=id1.get(i);
		}
		
		adminService.approveCustomers(id2);
		
		return "Success";
	}

	@Override
	public boolean addDefaultAccountNumber(long id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String lockCustomers(IdList id) {
		List<String> id1 = id.getIdList();
		System.out.println(id.getIdList());
		String[] id2 = new String[20];
		for(int i=0;i<id1.size();i++)
		{
			id2[i]=id1.get(i);
		}
		adminService.lockCustomers(id2);
		return "Success";
	}

	@Override
	public CustomerFormList listUnlockedCustomers() {
		List<CustomerForm> customerForms = adminService.listUnlockedCustomers();
		CustomerFormList customerFormList = new CustomerFormList();
		customerFormList.setCustomerFormList(customerForms);
		return customerFormList;
	}

	@Override
	public String unlockCustomers(IdList id) {
		List<String> id1 = id.getIdList();
		String[] id2 = new String[20];
		for(int i=0;i<id1.size();i++)
		{
			id2[i]=id1.get(i);
		}
		adminService.unlockCustomers(id2);
		return "Success";
	}

	@Override
	public CustomerFormList listlockedCustomers() {
		List<CustomerForm> customerForms = adminService.listlockedCustomers();
		CustomerFormList customerFormList = new CustomerFormList();
		customerFormList.setCustomerFormList(customerForms);
		return customerFormList;
	}

	@Override
	public CustomerFormList showCustomers() {
		List<CustomerForm> customerForms = adminService.showCustomers();
		CustomerFormList customerFormList = new CustomerFormList();
		customerFormList.setCustomerFormList(customerForms);
		return customerFormList;
	}

	@Override
	public String changePasword(String userid, String password) {
		Encrypter encrypter=new Encrypter();
		adminService.changePasword(userid, encrypter.encrypt(password));
		return "Success";
	}

	@Override
	public String authentication(String userid, String password)
			throws AuthenticateMessageException {
		String result;
		Encrypter encrypter=new Encrypter();
		if(!(customerService.validateCustomer("admin",encrypter.encrypt(password)).getLoginid()==null))
		{
			result = "Success";
		}
		else {
			result = "Fail";
		}
		System.out.println(result);
		return result;
	}

}
