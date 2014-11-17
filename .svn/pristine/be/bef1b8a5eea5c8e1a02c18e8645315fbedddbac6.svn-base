package com.spring.jax.web.service;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;
import javax.jws.soap.SOAPBinding.Use;

import com.spring.model.CustomerFormList;
import com.spring.util.IdList;
import com.spring.web.service.exception.AuthenticateMessageException;

@WebService
@SOAPBinding(style=Style.RPC,use=Use.LITERAL)
public interface AdminService {
	 @WebMethod
	  public String authentication(@WebParam(name="userid",header=true)String userid,@WebParam(name="password",header=true)String password) throws AuthenticateMessageException;
	@WebMethod
	public CustomerFormList listUnapprovedCustomers();
	@WebMethod
	public String approveCustomers(IdList id );
	@WebMethod
	boolean addDefaultAccountNumber(long id);
	@WebMethod
	public String lockCustomers(IdList id );
	@WebMethod
	public CustomerFormList listUnlockedCustomers();
	@WebMethod
	public String unlockCustomers(IdList id );
	@WebMethod
	public CustomerFormList listlockedCustomers();
	@WebMethod
	public CustomerFormList showCustomers();
	@WebMethod
	public String changePasword(String userid,String password);

}
