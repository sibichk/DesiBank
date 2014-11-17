package com.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.impl.AdminDao;
import com.spring.model.CustomerForm;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Override
	public List<CustomerForm> listUnapprovedCustomers() {
		return adminDao.listUnapprovedCustomers();
	}

	@Override
	public String approveCustomers(String[] id) {
		return adminDao.approveCustomers(id);
	}
	
	@Override
	public boolean addDefaultAccountNumber(long id){
		return	adminDao.addDefaultAccountNumber(id);
	}

	@Override
	public String lockCustomers(String[] id) {
		return adminDao.lockCustomers(id);
	}

	@Override
	public List<CustomerForm> listUnlockedCustomers() {
		
		return adminDao.listUnlockedCustomers();
	}

	@Override
	public String unlockCustomers(String[] id) {
		return adminDao.unlockCustomers(id);
	}

	@Override
	public List<CustomerForm> listlockedCustomers() {
		return adminDao.listLockedCustomers();
	}

	@Override
	public List<CustomerForm> showCustomers() {
		return adminDao.showCustomers();
	}

	@Override
	public String changePasword(String userid, String password) {
		return adminDao.changePassword(userid, password);
	}

	@Override
	public boolean addDefaultTransactionID(long id) {
		return adminDao.addDefaultTransactionID(id);
	}

}
