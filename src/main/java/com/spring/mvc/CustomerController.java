package com.spring.mvc;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;








import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.MailSendException;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import com.desi.bank.exception.DesiBankException;
import com.spring.dao.entity.Customer;
import com.spring.dao.entity.CustomerAccountInfo;
import com.spring.dao.entity.CustomerTransactionHistory;
import com.spring.dao.entity.PayeeInfo;
import com.spring.dao.entity.SecurityQuestions;
import com.spring.model.AddPayee;
import com.spring.model.CustomerForm;
import com.spring.model.MiniStatementVO;
import com.spring.model.UserSessionVO;
import com.spring.service.impl.CustomerService;
import com.spring.service.impl.MailService;
import com.spring.util.Encrypter;




@Service
@Controller
public class CustomerController {
	
	
	/**
	 * Initiate Logger for this class
	 */
	private static final Log logger = LogFactory.getLog(CustomerController.class);
	
	@Autowired
	@Qualifier("mailServiceImpl")
	public MailService mailServiceImpl;
	
	@Autowired
	@Qualifier("customerServiceImpl")
	public CustomerService customerService;
	
	
	@RequestMapping(value = "showCustomerRegistration.htm", method = RequestMethod.GET)
	public String register(Model model, HttpSession session,HttpServletRequest request) {
		    //CustomerForm customer=new CustomerForm();
		    //model.addAttribute("customer",customer);
		    List<SecurityQuestions> sq1= (List<SecurityQuestions>)customerService.securityQns();
		    model.addAttribute("questions", sq1);
		    List<SecurityQuestions> sq2 = (List<SecurityQuestions>)customerService.securityQns2();
		    model.addAttribute("questions2", sq2);
		    return "customerRegistration";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		// to actually be able to convert Multipart instance to byte[]
		// we have to register a custom editor
		binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
		// now Spring knows how to handle multipart object and convert them
	}

	@RequestMapping(value = "showCustomerRegistration.htm", method = RequestMethod.POST)
	public String addCustomer(@ModelAttribute("customer") CustomerForm customer,
			@RequestParam(value="file",required=false)MultipartFile file,ModelMap map) {
		System.out.println(customer);
		if(!file.isEmpty()){
			customer.setPhotoName(file.getOriginalFilename());
		}
		try {
			customer.setImage(file.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		customer.setApproved("0");
	     //customer.setLocked("yes");
	     customer.setAccountNum("NA");
	     StringBuilder sb= new StringBuilder();
	        sb.append("Welcome to Desi Bank");
	        sb.append("\n\n User id is " + customer.getUserid());
	        sb.append("\n\n Password is " + customer.getPassword());
	     Encrypter encrypter=new Encrypter();
	     
	     //Password is encrypted before persisting in database
	     customer.setPassword(encrypter.encrypt(customer.getPassword()));
	     try{
	    	try { 
	    		customerService.persistCustomer(customer);
	    	}catch (DesiBankException  e) {
	    		if(logger.isErrorEnabled()){
	    			logger.error(e.getMessage());
	    			logger.error(e.getCause());
	    		}
	    		e.printStackTrace();
	    		return "adminError";
			}
	       /* StringBuilder sb= new StringBuilder();
	        sb.append("Welcome to Desi Bank");
	        sb.append("\n\n User id is " + customer.getUserid());
	        sb.append("\n\n Password is " + customer.getPassword());*/
	        mailServiceImpl.sendMail("DesiBank", customer.getEmail(),"Registration Successfull", sb.toString());
	     }
	     catch (MailSendException e) {
	    	 if(logger.isErrorEnabled()){
	    			logger.error(e);
	    		}
	    	 map.addAttribute("emailMessage", "Email could be sent since you are not connected with internet!");
	     }
	    map.addAttribute("msg", "You have registered Successfully!");
		return "login";
	}
	
	@RequestMapping(value = "allCustomers.htm", method = RequestMethod.GET)
	public String allCustomers(Model model) {
		 List<CustomerForm> customerForms=customerService.findCustomers();
		 model.addAttribute("customerForms",customerForms);
		return "customers";
	}
	
	@RequestMapping(value = "deleteCustomer.htm", method = RequestMethod.GET)
	public String deleteCustomer(@RequestParam(value="id") int id, Model model ){
	//public String deleteCustomer(@ModelAttribute("customerForms") CustomerForm customerForms ){
	     System.out.println("cust id = " + id);
		if (customerService.deleteCustomer(id)){
			List<CustomerForm> customerForms=customerService.findCustomers();
			 model.addAttribute("customerForms",customerForms);
			return "customers";
			
	//how do i call allCustomers page from here
	     }else{
		    return "error";
	     }
	}
	
	@RequestMapping(value = "editCustomer.htm", method = RequestMethod.GET)
	public String getCustomer(Model model, @RequestParam(value="id") int id) {
		CustomerForm customerForms = customerService.getCustomer(id);
		 model.addAttribute("customerForms",customerForms);
		return "editCustomer";
	}
	
	
	@RequestMapping(value = "editCustomer.htm", method = RequestMethod.POST)
	public String updateCustomer(@ModelAttribute("customer") CustomerForm customer, Model model,  HttpSession session) {
		  customerService.updateCustomer(customer);
		  UserSessionVO userSessionVO= (UserSessionVO) session.getAttribute("userSessionVO");
		  String loginid=userSessionVO.getLoginid();
		  CustomerForm customerdetail= (CustomerForm) customerService.getUserDetail(loginid);
		   model.addAttribute("detail",customerdetail);
		   return "customer";
		   
	}
	
	@RequestMapping(value = "/customer/showCustomerAccounts.htm", method = RequestMethod.GET)
	public String customerAccount(Model model, HttpSession session,HttpServletRequest request ) {
		String userid = ((UserSessionVO)session.getAttribute("userSessionVO")).getLoginid();
		 List<CustomerAccountInfo> customerAccountList=customerService.getAccountDetails(userid);
		 if(customerAccountList.isEmpty())
		 {
			request.setAttribute("msg", "no"); 
		 }
		 else {
			request.setAttribute("msg", "yes");
		}
		 model.addAttribute("customerAccountList",customerAccountList);
		return "customerAccountInfo";
	}
	
	@RequestMapping(value = "/customer/showCustomerAccountsSummary.htm", method = RequestMethod.GET)
	public String customerAccountSummary(Model model, HttpSession session ) {
		String userid = ((UserSessionVO)session.getAttribute("userSessionVO")).getLoginid();
		 List<CustomerAccountInfo> customerAccountList=customerService.getAccountDetails(userid);
		 model.addAttribute("customerAccountList",customerAccountList);
		return "customerAccountInfoSummary";
	}
	
	
	@RequestMapping(value = "customer/myAccountSummary/MiniStatement.htm", method = RequestMethod.GET)
	public String customerMiniStatement(Model model, HttpSession session, HttpServletRequest request ) {
		String userid = ((UserSessionVO)session.getAttribute("userSessionVO")).getLoginid();
		 List<MiniStatementVO> miniStatementVO=customerService.getTransactionDetails(userid);
		 //model.addAttribute("miniStatementVO",miniStatementVO);
		 request.setAttribute("customerAccountList", miniStatementVO);
		return "miniStatement";
	}
	
	
	@RequestMapping(value = "customer/addPayee.htm", method = RequestMethod.GET)  
	public String addPayee(HttpSession session,Model model) {
		UserSessionVO userSessionVO= (UserSessionVO) session.getAttribute("userSessionVO");
		String userid=userSessionVO.getLoginid();
		List<Customer> email = customerService.retrieveEmail(userid);
		model.addAttribute("email",email.get(0).getEmail());
		model.addAttribute("addpayee", new AddPayee());
		return "addPayee";
	}
	
	@RequestMapping(value = "customer/confirmPayee.htm", method = RequestMethod.POST)
	public String confirmPayee(@Valid @ModelAttribute("addpayee") AddPayee addpayee,BindingResult result,Model model,HttpSession session ) { 
			
			if (result.hasErrors()) {
				return "addPayee";	
			}	
			PayeeInfo payee = new PayeeInfo();
			payee.setCustomerId(((UserSessionVO)session.getAttribute("userSessionVO")).getLoginid());
			
			payee.setPayeeAccountNo(addpayee.getPayeeAccountNo());
			payee.setPayeeName(addpayee.getPayeeName());
			payee.setPayeeNickName(addpayee.getPayeeNickName());
			int random = (int) (Math.random()*1000);
			mailServiceImpl.sendMail("DesiBank", addpayee.getEmail(),"Add payee submission number", "Confirmation code:"+random);
			model.addAttribute("addPayeeInfo", payee);
			model.addAttribute("code",random);
			session.setAttribute("payee", payee);
			return "confirmPayee";
			//return "addPayee";
	}
	
	
	@RequestMapping(value = "customer/finishConfirm.htm", method = RequestMethod.POST)
	public String finishConfirmPayee(HttpSession session, Model model) {
		
		//((UserSessionVO)session.getAttribute("userSessionVO")).getLoginid();
		//System.out.println(((PayeeInfo)session.getAttribute("payee")).toString());
		PayeeInfo payee = (PayeeInfo) session.getAttribute("payee");
		customerService.addPayee(payee);
		UserSessionVO userSessionVO= (UserSessionVO) session.getAttribute("userSessionVO");
		String loginid=userSessionVO.getLoginid();
		CustomerForm customerdetail= (CustomerForm) customerService.getUserDetail(loginid);
		model.addAttribute("detail",customerdetail);
		model.addAttribute("message","Payee added!");
		return "customer";
	}
	
	@RequestMapping(value = "customer/transferMoney.htm", method = RequestMethod.GET)
	public String selectPayee(HttpSession session, HttpServletRequest request ) {
		
		List<PayeeInfo> payeeList = customerService.getPayeeList(((UserSessionVO)session.getAttribute("userSessionVO")).getLoginid());
		request.setAttribute("payeeList", payeeList);
		
		return "transferMoney";
	}
	
	@RequestMapping(value = "customer/transferMoney.htm", method = RequestMethod.POST)
	public String transactionDetails(HttpSession session, HttpServletRequest request ) {
		
		CustomerForm customerForm = customerService.getCustomer(((UserSessionVO)session.getAttribute("userSessionVO")).getLoginid());
		request.setAttribute("customerForm", customerForm);
		
		List<PayeeInfo> payeeList = customerService.getPayeeList(((UserSessionVO)session.getAttribute("userSessionVO")).getLoginid());
		request.setAttribute("payeeList", payeeList);
		
		request.setAttribute("selectedPayeeName", request.getParameter("selectedPayeeName"));
		return "transactionMoney";
	}
	
	
	
	@RequestMapping(value="customer/transactionMoney.htm", method = RequestMethod.POST)
	public String transferMoney(HttpSession session, HttpServletRequest request,Model model ) {
		
			CustomerTransactionHistory transaction = new CustomerTransactionHistory();
			transaction.setFromAccountNumber(request.getParameter("fromAccountNumber"));
			transaction.setToAccountNumber(request.getParameter("selectedPayee"));
			transaction.setAmount(Integer.parseInt(request.getParameter("transactionAmount")));
			transaction.setDescription(request.getParameter("transactionRemarks"));
			//transaction.setDate(request.getParameter("date")); 
			Date date= new Date();
			try {
				date = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH).parse(request.getParameter("date"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(request.getParameter("optionType").equals("PayNow")){
				transaction.setTransactionMode("transferred");
				transaction.setLoginId(((UserSessionVO)session.getAttribute("userSessionVO")).getLoginid());
				transaction.setDate(date);
				customerService.persistCustomerTransaction(transaction);
			}
			else{
				//System.out.println(date);
				transaction.setTransactionMode("scheduled");
				transaction.setLoginId(((UserSessionVO)session.getAttribute("userSessionVO")).getLoginid());
				transaction.setDate(date);
				transaction.setId(0);
				customerService.scheduledCustomerTransaction(transaction);
			}
			
			
			UserSessionVO userSessionVO= (UserSessionVO) session.getAttribute("userSessionVO");
			String loginid=userSessionVO.getLoginid();
			CustomerForm customerdetail= (CustomerForm) customerService.getUserDetail(loginid);
			model.addAttribute("detail",customerdetail);
			return "customer";
		
		
	}
	
	
	
	@RequestMapping(value = "customer/registeredPayees.htm", method = RequestMethod.GET)
	public String allRegisteredPayee(HttpSession session, HttpServletRequest request ) {
		List<PayeeInfo> payeeList = customerService.getPayeeList(((UserSessionVO)session.getAttribute("userSessionVO")).getLoginid());
		request.setAttribute("payeeWebForm", payeeList);
		return "registeredPayee";
		//Pageable p;
	}
	
	@RequestMapping(value="loan/loan.htm", method = RequestMethod.GET)
	public String loanPage( ) {
		
		return "loan";
	}

	
}
