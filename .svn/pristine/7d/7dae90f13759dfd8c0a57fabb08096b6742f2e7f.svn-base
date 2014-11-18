package com.spring.util;

import java.io.InputStream;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.desi.bank.constant.DesiBankConstant;
import com.spring.model.CustomerForm;
import com.spring.model.UserSessionVO;
import com.spring.service.impl.AdminService;
import com.spring.service.impl.CustomerServiceImpl;

public class AdminUserListener  implements ServletContextListener{
	
	/**
	 * Initiate Logger for this class
	 */
	private static final Log logger = LogFactory.getLog(AdminUserListener.class);

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		try{
			if(logger.isInfoEnabled()) {
				logger.info("Inside the method contextInitialized");
			}
			//This is new code to access Spring Root Web Application Context
			ServletContext servletContext=arg0.getServletContext();
			ApplicationContext applicationContext=WebApplicationContextUtils.getWebApplicationContext(servletContext);
			CustomerServiceImpl customerServiceImpl=(CustomerServiceImpl)applicationContext.getBean("customerServiceImpl");
			UserSessionVO userSessionVO=customerServiceImpl.validateCustomerByUserId("admin");
			if(userSessionVO.getLoginid()==null) {
				
				//
				Properties properties=new Properties();
				InputStream inputStream=servletContext.getResourceAsStream(DesiBankConstant.USERS_PROPERTIES_FILE);
				properties.load(inputStream);
				if(logger.isInfoEnabled()) {
					logger.info("Loaded properties  = "+properties);
				}
				CustomerForm customerForm=new CustomerForm();
				customerForm.setQuestion1(properties.getProperty("question1"));
				customerForm.setAnswer1(properties.getProperty("answer1"));
				customerForm.setQuestion2(properties.getProperty("question2"));
				customerForm.setAnswer2(properties.getProperty("answer2"));
				customerForm.setAccountNum(properties.getProperty("accountnum"));
				customerForm.setAddress(properties.getProperty("address"));
				customerForm.setAge(Integer.parseInt(properties.getProperty("age")));
				customerForm.setApproved(properties.getProperty("approved"));
				customerForm.setDob(properties.getProperty("dob"));
				customerForm.setEmail(properties.getProperty("email"));
				customerForm.setGender(properties.getProperty("gender"));
				customerForm.setJobTitle(properties.getProperty("jobtitle"));
				customerForm.setName(properties.getProperty("name"));
				
			     Encrypter encrypter=new Encrypter();
				  //Password is encrypted before persisting in database
				customerForm.setPassword(encrypter.encrypt(properties.getProperty("password")));
				customerForm.setUserid(servletContext.getInitParameter("userid"));
				customerServiceImpl.persistCustomer(customerForm);
			}
			AdminService adminService=(AdminService)applicationContext.getBean("adminServiceImpl");
			addDefaultAccountNumber(adminService);
			addDefaultTransactionID(adminService);
			
		}catch (Exception e) {
			//e.printStackTrace();
			if(logger.isErrorEnabled()){
				logger.error(e);
			}
			if(logger.isDebugEnabled()){
				logger.debug("Admin already exists or you have some issue with DB connection!");
			}
		}
	}
	
	private void addDefaultAccountNumber(AdminService adminService){
		adminService.addDefaultAccountNumber(1);
	}
	
	public boolean addDefaultTransactionID(AdminService adminService)
	{
		return adminService.addDefaultTransactionID(1);
	}
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}


}
