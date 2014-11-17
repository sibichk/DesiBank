<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
</head>

<body>
<jsp:include page="customerHeader.jsp" />


<div id="content">

<div id="right" style="width: 100%; height: 433">&nbsp;
<b> Funds Transfer- Other DesiBank Account across India</b> 
<hr />

<b> Add Payee - Enter Details</b>

<p align="center"><font size="3" color="red"><b>
<%=request.getAttribute("errorMsg")!=null?request.getAttribute("errorMsg"):""%>
</b></font></p>

<!-- form method="post" action="confirmDetails.htm" -->
<form method="post" action="confirmPayee.htm">
	<table border="0" align="center">

      <tr>	
		<td align="left"> Payee Account Number </td>
		<td align="left"> <input type="text" name="payeeAccountNo" value=""/> </td>
	  </tr>
      <tr>	
		<td align="left"> Re enter Account Number </td>
		<td align="left"> <input type="text" name="accountNumber2" value=""/> </td>
	  </tr>
	   <tr>	
		<td align="left"> Payee Name </td>
		<td align="left"> <input type="text" name="payeeName" value=""/> </td>
	  </tr>
	   <tr>	
		<td align="left"> Payee Nick Name </td>
		<td align="left"> <input type="text" name="payeeNickName" value=""/> </td>
	  </tr>
	   <tr>	
		<td align="left"> Payee Registraion alert to be sent on Mobile no </td>
		<td align="left"> <input type="text" name="mobile" value=""/> </td>
	  </tr>
	  
	  <tr>
	   <td>
	   <br />
	   <br />
	   
	   <input type="submit" value="Next"/>
	   <input type="button" value="Back"/>
	   </td>
	  </tr>
	</table>
</form>

</div>

</div>

<br></br>
<br></br>
<br></br>
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