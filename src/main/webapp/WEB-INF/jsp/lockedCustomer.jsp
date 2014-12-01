<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
<script src="<%=request.getContextPath() %>/js/jquery-1.6.4.js" type="text/javascript">

</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
<jsp:include page="adminHeader.jsp" />	
<div id="content">

<div id="right" style="width: 100%; height: 433">&nbsp;
<hr />


<h3 align="center" ><font color="#FFFF00" face="Arial Black">Customers Data</font></h3>
	<p align="center" ><font color="white" face="Arial Black">  

  <form id="ApproveCustomers" action="lockedCustomers.htm" method="post">
  <table border="1" align="center">
  			<tbody id="fbody">
			<tr>
	    		<td><User ID:</td>
	    		 <td>Name:</td>
	    		 <td>Email:</td>
	    		 <td>Mobile:</td>
	    		 <td>Address:</td>
	    		 <td>Select / Unselect:</td>
	    		 
		     </tr>
		     <c:forEach var="cust"  items="${customerForms}">
		     <tr>
	    		 <td>${cust.userid}</td>
	    		 <td>${cust.name}</td>
	    		 <td>${cust.email}</td>
	    		 <td>${cust.mobile}</td>
	    		 <td>${cust.address}</td>
	        <%-- <td><b class="text1">${cust.approved}</b></td> --%>
	            <%--  <spring:checkbox path="${customerForms}" value="${cust.approved}" /> --%>
	            
	    		 <%-- <spring:checkbox path="approved" value="${cust.approved}" /> --%>
	    		 <td><input type="checkbox" name="approveCustomer" value="${cust.id}" /></td>
		     </tr>
		     
		     </c:forEach>
		    </tbody>
			<input type="submit" value="  Lock  " id="sendData"/>
		
</table>

</form>
</div>
</div>
<p id="result"></p>
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