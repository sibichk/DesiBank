package com.spring.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.spring.dao.entity.CustomerTransactionHistory;



@Service
public class ScheduledService {


@Autowired
@Qualifier("customerServiceImpl")  
private CustomerService customerService;
public CustomerTransactionHistory transactionUpdate;
	@Scheduled(cron="*/20 * * * * ?")
	public void doSchedule() {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		   //get current date time with Date()
		System.out.println("scheduler method");
		
		   Date date = new Date();
		  // System.out.println(dateFormat.format(date));
		List<CustomerTransactionHistory> transaction= customerService.scheduledTransfer();
		transaction.get(0).getDate();
		for (CustomerTransactionHistory customerTransactionHistory : transaction) {
			//long id = customerTransactionHistory.getTransactionId();
			//long from_db = customerTransactionHistory.getDate().getTime();
			long time = customerTransactionHistory.getDate().getTime()-date.getTime();  //if result is positive the date is yet to arrive
			if(time<=0){
			 //transactionUpdate.setTransactionMode("transferred");
				
				System.out.println("trans no.");
			}
		}
        //System.out.println("date from database"+transaction.get(0).getDate());
    }
	
}
