<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@page import="com.spring.dao.entity.SecurityQuestions"%>
<%@page import="java.util.List"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Corporate by Free CSS Templates</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="<%=request.getContextPath() %>/css/desibank.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/style.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/all.css"
	rel="stylesheet" type="text/css" />	
<script src="<%=request.getContextPath() %>/js/jquery-1.6.4.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="<%=request.getContextPath() %>/js/jquery.validate.min1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$( "#dob" ).datepicker();
		
		$("#customerRegistration").validate({
					rules: {
						userid: {
							required: true,
							minlength: 2,
							maxlength: 3
						},
						password: {
							 required: true,
							 minlength: 8
						 },
						name: {
							
							required: true,
							minlength: 2,
							maxlength: 15
							
						},
						address: {
							
							required: true,
							minlength: 4,
							maxlength: 10
							
						},
						
						email: {
							 required: true,
							 email:true 
						 },
						 
						 age :{
							 required: true,
							 min: 15
						},
						 mobile :{
							 required: true,
							 minlength: 9,
							 maxlength: 15
							 
						 }
						 
						
					},
					
					messages:  {
						
						userid: {
							
							required: "Please enter the userid",
							minlength: "Userid should be 2 character long",
							maxlength: "Userid can not exceed the length 3"
							
						},
						name: {
							
							required: "Please enter the name",
							minlength: "Name should be 2 character long",
							maxlength: "Name can not exceed the length 15"
							
						},
						address: {
							
							required: "Please enter the address",
							minlength: "Address should be 4 character long",
							maxlength: "Address can not exceed the length 10"
							
						},
						
						email: {
							required: "Please enter an email",
							email: "Please enter a valid Email"
						},
						
						age: {
							required: "Please enter the age ",
							min: "Age should be above 15"
						},
						
						mobile: {
							required: "Please enter the mobile number ",
							minlength: "Mobile no. should be 9 character long",
							maxlength: "Mobile no. can not exceed the length 15"
							
						},
						password: {
							required: "Please enter a Password",
							minlength: "Password must be 8 character long"
						}
						
					},
					
					submitHandler: function(form) {
						 $(form).ajaxSubmit();
						 }
				});
			 
	});
			 /*
				var success=1;
				$('#sendData').click(function(){
					 if($('#userid').val ().length==0){
						alert("Enter a valid userid");
						success=0;
					}
					 
					else if($('#password').val().length==0){
						alert("Enter a valid password");
						success=0;
					}
					else if($('#name').val().length==0){
						alert("Enter your name");
						success=0;
					}
					else if($('#email').val().length==0){
						alert("Enter a valid email address");
						success=0;
					}
					else if($('#mobile').val().length==0){
						alert("Enter a valid mobile number");
						success=0;
					}
					else if($('#ssn').val().length==0){
						alert("Enter your valid SSN");	
						success=0;
					}
				});
					 
			 if(success==1){
			 	$('#customerRegistration').submit();
			 } */
		
	
</script>

</head>
<body>
<div id="header"><img
	src="<%=request.getContextPath() %>/images/registration.jpg" width="100%"
	height="200"></img>
	<br><marquee   align="center"  behavior="alternate"
			style="COLOR: #FF5050; font-family:Verdana; font-weight:bold"  scrollDelay=100  width=700
			bgColor=#FFFFFF height=16>Welcome To Online
		Desi@Bank </marquee></font> 
	</div>
<div id="content">

<div id="right" style="width: 100%; height: 433">&nbsp;
<hr />

<h3 align="center" ><font color="#FFFF00" face="Arial Black">Customer Registration</font></h3>
	<font color="white" face="Arial Black">
	
  
  <spring:form id="customerRegistration"  method="POST" commandName="customer" enctype="multipart/form-data">
  	<div class="reg" style="display:inline-block;">
	<table border="0" align="center">
		<tr>
			<td><b class="text1">User ID*:</b></td>
			<td>
			<strong><b><input  type="text"  id="userid" name="userid" size="20" style="text1" /></b></strong></td>
		</tr>
		 <tr>
			<td><b class="text1">Password*:</b></td>
			<td>
			<input type="password" id="password" name="password" style="text1"/></td>
		</tr> 
		
		<tr>
			<td><b class="text1">Name*:</b></td>
			<td>
			<input  type="text"  id="name" name="name" size="20" style="text1" />
			</td>
		</tr>
		
		<tr>
			<td><b class="text1">Address:</b></td>
			<td>
			<textarea rows="2" cols="30" name="address" id="address"></textarea>
			</td>
		</tr>
		
		<tr>
			<td><b class="text1">Email*:</b></td>
			<td>
			<input type="text" id="email" name="email" style="text1" size="40"/></td>
		</tr>
		
		<tr>
			<td><b class="text1">Mobile*:</b></td>
			<td>
			<input type="text" id="mobile" name="mobile" style="text1" size="13"/></td>
		</tr>
		
		<tr>
			<td><b class="text1">SSN*:</b></td>
			<td>
			<input type="text" id="ssn" name="ssn" style="text1" size="13"/></td>
		</tr>
		<tr>
			<td><b class="text1">Age:</b></td>
			<td>
			<input type="text" id="age" name="age" style="text1" size="13"/></td>
		</tr>
		
		<tr>
			<td><b class="text1">GENDER:</b></td>
			<td>
			   <select name="gender">
			            <option value="male">Male</option>
			            <option value="female">Female</option>
			   </select>
			</td>
		</tr>
		
		</table>
		</div> 
		<div class="reg" style="display:inline-block;">
		<table border="0" align="center">
		<tr>
			<td><b class="text1">DOB:</b></td>
			<td>
			<input type="text" id="dob" name="dob" style="text1" size="13"/></td>
		</tr>
		
		<tr>
			<td><b class="text1">Father:</b></td>
			<td>
			<input type="text" id="father" name="father" style="text1" size="13"/></td>
		</tr>
		
		<tr>
			<td><b class="text1">Qualification:</b></td>
			<td>
			<input type="text" id="qualification" name="qualification" style="text1" size="13"/></td>
		</tr>
		
		<tr>
			<td><b class="text1">Job Title:</b></td>
			<td>
			   <select name="jobTitle">
			            <option value="Software Engg">Software Engg</option>
			            <option value="Business Man">Business Man</option>
			   </select>
			</td>
			
		</tr>
		
		<tr>
			<td><b class="text1">Photo:</b></td>
			<td>
			  <input type="file" name="file"/>
			</td>
			
		</tr>
		<tr>
			<td>Security Question 1*:</td>
			<td>
	  
		 <select id="question1" name="question1"> 
			  <c:forEach items="${questions}" var="item" >
			 <option>${item.questions}</option>
			 </c:forEach> 
		</select> 
			</td>
			
		</tr>
		<tr>
			<td><b class="text1">Answer1*:</b></td>
			<td>
			<textarea rows="2" cols="30" name="answer1" id="answer1"></textarea>
			</td>
		</tr>
		
		<tr>
			<td>Security Question 2*:</td>
			<td>
				<select id="question2" name="question2"> 
			  <c:forEach items="${questions2}" var="item" >
			 <option>${item.questions}</option>
			 </c:forEach> 
		</select>
			</td>
			
		</tr>
		<tr>
			<td><b class="text1">Answer2*:</b></td>
			<td>
			<textarea rows="2" cols="30" name="answer2" id="answer2"></textarea>
			</td>
		</tr>
		</table>
		</div>
		<p align="center">
		<tr>
			<td colspan="2" align="right"><input type="submit"
				value="Register" id="sendData"/></td>
		</tr>
		
		</p>
</spring:form>
</div>
</div>
<p id="result"></p>

<div id="footer">
<p>Copyright © 2006 Sitename.com. Designed by <a
	href="http://www.freecsstemplates.org" class="link1">Free CSS
Templates</a> | Downloaded from <a href="http://www.cssbank.com/"><strong>Free
CSS Resource Bank</strong></a></p>
</div>
</body>
</html>