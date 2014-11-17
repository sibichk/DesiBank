<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Customer Home Page</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="<%=request.getContextPath() %>/css/desibank.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/style.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
<div id="header"><img
	src="<%=request.getContextPath() %>/images/header.png" width="700"
	height="100"></img>
	<br><marquee   align="center"  behavior="alternate"
			style="COLOR: #FF5050; font-family:Verdana; font-weight:bold"  scrollDelay=100  width=700
			bgColor=#FFFFFF height=16>Welcome To Online
		Desi@Bank </marquee></font> 
	</div>
	
	<div id="menu">
	<ul>
		<li><a href="${pageContext.request.contextPath}/customer/showCustomerAccounts.htm">My Accounts</a></li>
		<li><a href="${pageContext.request.contextPath}/customer/transferMoney.htm">Fund Transfer</a></li>
		<li><a href="${pageContext.request.contextPath}/customer/showCustomerAccountsSummary.htm">Account Summary</a></li>
		<li><a href="${pageContext.request.contextPath}/customer/addPayee.htm">Add Payee</a></li>
		<li><a href="${pageContext.request.contextPath}/customer/registeredPayees.htm">Registered Payees</a></li>
		<li><a href="${pageContext.request.contextPath}/login.htm">logout</a></li>
		<li><a href="${pageContext.request.contextPath}/loan/loan.htm">Loan</a></li>
	</ul>
</div>
<div id="content">

<p align="left"><font size="3" color="red"><b>
<%=request.getAttribute("msg")!=null?request.getAttribute("msg"):""%>
</b></font></p>

<div id="menu" style="width: 30%; height: 433" >
	<ul>
		<li><a href="${pageContext.request.contextPath}/customer/showCustomerAccounts.htm">HOME LOAN</a></li>
		<br></br>
		<li><a href="${pageContext.request.contextPath}/customer/transferMoney.htm">CAR LOAN</a></li>
		<br></br>
		<li><a href="${pageContext.request.contextPath}/customer/showCustomerAccountsSummary.htm">PERSONAL LOAN</a></li>
		
	</ul>
	</font>
  
</div>
</div>
<br></br>
<br></br>
<br></br>



<div id="footer">
<p>Copyright © 2006 Sitename.com. Designed by <a
	href="http://www.freecsstemplates.org" class="link1">Free CSS
Templates</a> | Downloaded from <a href="http://www.cssbank.com/"><strong>Free
CSS Resource Bank</strong></a></p>
</div>
</body>
</html>