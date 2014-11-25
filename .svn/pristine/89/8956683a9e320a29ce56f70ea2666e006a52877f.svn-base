package com.spring.mvc;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dao.entity.Customer;
import com.spring.dao.entity.SecurityQuestions;
import com.spring.model.CustomerForm;
import com.spring.model.LoginJSONResponse;
import com.spring.model.UserSessionVO;
import com.spring.service.impl.CustomerService;
import com.spring.util.Encrypter;

@Controller
public class ValidateUserController {
	
	@Autowired
	@Qualifier("customerServiceImpl")
	public CustomerService customerService;
	
	@RequestMapping(value = "login.htm", method = RequestMethod.GET)
	public String loginPage() {
			return "login";
	}

	/**
	 * method which is exposed as a restful web service
	 * which will validate userid and password and called by ajax   
	 * @param userid
	 * @param password
	 * @return
	 */
	@RequestMapping(value = "ajaxCall.htm", method = RequestMethod.GET)
	public @ResponseBody LoginJSONResponse login(@RequestParam(value = "userid", required = false) String userid,
			@RequestParam(value = "password", required = false) String password) {
		
		Encrypter encrypter=new Encrypter();
		//checking null condition for userid and password
		if(password==null){
			password=""; 
		}
		if(userid==null){
			userid="";
		}
		//Password is encrypted before persisting in database
		UserSessionVO userSessionVO = customerService.validateCustomer(userid, encrypter.encrypt(password));
		LoginJSONResponse jsonResponse=new LoginJSONResponse();
		
		 if (userSessionVO.getLocked()!=null && userSessionVO.getLocked().equalsIgnoreCase("no") && userSessionVO.getRole() != null ){
			 
			jsonResponse.setStatus("valid");
			jsonResponse.setDescription("Authentication is done!");
			if(userSessionVO.getApproved()!=null){
				jsonResponse.setStatus("invalid");
				jsonResponse.setDescription("Your Account is not approved ,Please contact with admin!!");
			}
			
		}else{
			if(userSessionVO.getLoginid()==null){
				jsonResponse.setStatus("invalid");
				jsonResponse.setDescription("Sorry , User name and password is not correct!");	
			}else{
				jsonResponse.setStatus("invalid");
				jsonResponse.setDescription("Sorry , Your account is locked ,contactto bank admin!");
			}
			
		}
		return jsonResponse;
	}	
	
	@RequestMapping(value = "validate.htm", method = RequestMethod.POST)
	public String goAhead(Model model,
			@RequestParam(value = "userid", required = false) String userid,
			@RequestParam(value = "password", required = false) String password,HttpSession session) {
		
		 Encrypter encrypter=new Encrypter();
		  //Password is encrypted before persisting in database
		UserSessionVO userSessionVO = customerService.validateCustomer(userid, encrypter.encrypt(password));
		
		if(userSessionVO.getLoginid()==null) {
			// setting data in request scope using Model interface
			model.addAttribute("error", "Sorry , User name and password is not correct!");
			return "login";
		}
		System.out.println(userSessionVO.getLocked());
		System.out.println(userSessionVO.getRole());
		   if ( userSessionVO.getLocked().equalsIgnoreCase("no") && userSessionVO.getRole() != null ){
			   session.setAttribute("userSessionVO", userSessionVO);
			   if (userSessionVO.getRole().equalsIgnoreCase("customer")){
				 //return customer detail from customer_tbl
				   CustomerForm customerdetail= (CustomerForm) customerService.getUserDetail(userid);
				   model.addAttribute("detail",customerdetail);
				   return "customer";
			   }else if(userSessionVO.getRole().equalsIgnoreCase("admin"))	{
	    	       return "admin";
		       }
		}else{
			// setting data in request scope using Model interface
			model.addAttribute("error", "User name and password is not correct!");
			return "login";
		 }
		//return cusomter detail from customer_tbl
		return "customer";
	}
	/*  method to fetch photo for profile page(after login)  */
	@RequestMapping(value = "showPhotoById.htm", method = RequestMethod.GET)
	public void showPhotoById(HttpServletRequest request,HttpServletResponse response) {
		String id=request.getParameter("id");
		byte[] photo=customerService.findPhotoById(Integer.parseInt(id));
		response.setContentType("image/jpeg");
		try {
			ServletOutputStream out = response.getOutputStream();
			if (photo != null)
				out.write(photo); //here we are writing photo into body of response
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/auth/logout.htm", method = RequestMethod.GET)
	public String loginLogout(HttpSession session) {
		
		session.invalidate();
		return "logout";
		
	}

  }


	

