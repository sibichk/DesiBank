package com.spring.jax.web.service;

import java.util.List;

import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.spring.model.MiniStatementList;
import com.spring.model.MiniStatementVO;
import com.spring.web.service.exception.AuthenticateMessageException;
import com.spring.web.service.exception.AuthenticationMessage;
import com.spring.web.service.exception.UnAuthenicateUser;
import com.spring.web.service.exception.UnAuthorizedUserException;

/**
 * @author ADMIN-2
 * We are following here JAX-WS 2.x specification for develop web service
 */
@WebService(endpointInterface="com.spring.jax.web.service.CustomerService",
		serviceName="customerWebService")
@Component
public class CustomerWebService implements com.spring.jax.web.service.CustomerService {
	
	@Autowired
	@Qualifier("customerServiceImpl")
	public com.spring.service.impl.CustomerService customerService;

	@Override
	public String authentication(String userid, String password) throws AuthenticateMessageException {
		      if(userid.equals("admin") && password.equals("password")) {
		                return "ax83axzxsxs";                        
		      } else{
		    	  AuthenticationMessage authenticationMessage=new AuthenticationMessage();
		    	  //this is detail message
		    	  authenticationMessage.setMessage("User id and password are not valid!");
		    	  authenticationMessage.setDescription("customer exception");
		    	  AuthenticateMessageException authenticateMessageException=new AuthenticateMessageException("Error occured",authenticationMessage);
		    	  throw authenticateMessageException;
		      }
	}

	@Override
	//Authorized
	public MiniStatementList customerMiniStatement(String userid,
			String sessionToken) throws UnAuthorizedUserException {
		  if(sessionToken==null || sessionToken.length()==0){
			  UnAuthenicateUser authenicateUser=new UnAuthenicateUser();
			  authenicateUser.setDescription("You are not Authorized to call this web service.............");
			  UnAuthorizedUserException authorizedUserException=new UnAuthorizedUserException("Permission is denied",authenicateUser);
		       throw authorizedUserException;
		  } else{
			  //This should be done by authentication server
			  if(!sessionToken.equals("ax83axzxsxs")) {
				  UnAuthenicateUser authenicateUser=new UnAuthenicateUser();
				  authenicateUser.setDescription("Token is not valid.............");
				  UnAuthorizedUserException authorizedUserException=new UnAuthorizedUserException("Permission is denied",authenicateUser);
			       throw authorizedUserException;
			  }
			  
		  }
		 //This will load xml file from classpath /src/main/resources folder of the maven
		 //ApplicationContext applicationContext=new ClassPathXmlApplicationContext("web-service-context.xml");
		  //CustomerDao customerDao =(CustomerDao)applicationContext.getBean("customerDaoImpl");
		  List<MiniStatementVO> miniStatementVO=customerService.getTransactionDetails(userid);
		  MiniStatementList miniStatementList=new MiniStatementList();
		  miniStatementList.setMiniStatementVO(miniStatementVO);
		 //model.addAttribute("miniStatementVO",miniStatementVO);
		 return miniStatementList;
	}

}
