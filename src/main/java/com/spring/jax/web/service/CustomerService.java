package com.spring.jax.web.service;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;
import javax.jws.soap.SOAPBinding.Use;

import com.spring.model.MiniStatementList;
import com.spring.web.service.exception.AuthenticateMessageException;
import com.spring.web.service.exception.UnAuthorizedUserException;

//This is interface 
@WebService
@SOAPBinding(style=Style.RPC,use=Use.LITERAL)
public interface CustomerService {
	
	  @WebMethod
	  public String authentication(@WebParam(name="userid",header=true)String userid,@WebParam(name="password",header=true)String password) throws AuthenticateMessageException;
	
	  @WebMethod
      public  MiniStatementList customerMiniStatement(@WebParam(name="uid") String userid,@WebParam(name="sessionToken",header=true) String sessionToken) throws UnAuthorizedUserException;
}
