<%@page import="com.spring.model.MiniStatementVO"%>
<%@page import="java.util.List"%>
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
		<li><a href="${pageContext.request.contextPath}/auth/logout.htm">logout</a></li>
	</ul>
</div>
<div id="content">
<div id="center"
	style="width: 100%; height: 400; background-color: #E6E6FA">
	<form>
	<table width="100%" height="350" border="0" align="center"
		cellpadding="0" cellspacing="0">

    <tr>
    <td align="top">
    <h3 align="center" class="style19">MINI STATEMENT</h3>
    <table border="1" align="center" height="37" width="90%" >
	
		<tr align="top">
			<td align="center" width="52">
			<font face="Trebuchet MS" color="#0000FF"><strong>SNo.</strong></font></td>
			
			<td align="center" width="71">
			  <span class="style4"><font face="Trebuchet MS" color="#0000FF">Destination Account Number</font></span></td>
			  <td align="center" width="71">
			<span class="style4"><font face="Trebuchet MS" color="#0000FF">Amount Transfered</font></span></td>
			<td align="center" width="71">
			  <span class="style4"><font face="Trebuchet MS" color="#0000FF">Date</font></span></td>
			  <td align="center" width="71">
			<span class="style4"><font face="Trebuchet MS" color="#0000FF">Description</font></span></td>
			<td align="center" width="71">
			  <span class="style4"><font face="Trebuchet MS" color="#0000FF">TransactionID</font></span></td>
			  
		</tr>

       <%
            List<MiniStatementVO> customerList=(List<MiniStatementVO>)request.getAttribute("customerAccountList");
            int count=0;
		    for(MiniStatementVO cv:customerList) {
          %> 
		 
		    <tr>
				<td align="center" width="52"><%=++count%></td>
				<td align="center" width="71"><%=cv.getToAccountNumber() %></td>
				<td align="center"><%=cv.getAmount() %></td>
				<td align="center"><%=cv.getDate() %></td>
				<td align="center"><%=cv.getDescription() %></td>
				<td align="center"><%=cv.getTransactionId()  %></td>
				
			</tr>
			<%
            }
           %>
           
		
	</table>	
		</td>
</tr>
	</table>

</form></div>
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