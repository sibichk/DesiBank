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


</head>
<body>
<jsp:include page="adminHeader.jsp" />	
<div id="content">

<div id="right" style="width: 100%; height: 433">&nbsp;
<hr />


<h3 align="center" ><font color="#FFFF00" face="Arial Black">Customers Data</font></h3>
	<p align="center" ><font color="white" face="Arial Black">
	
  
  <table border="1" align="center">
			<tr>
	    		<td><b class="text1">User ID:</b></td>
	    		 <td><b class="text1">Name:</b></td>
	    		 <td><b class="text1">Email:</b></td>
	    		 <td><b class="text1">mobile:</b></td>
	    		 <td><b class="text1">SSN:</b></td>
	    		 <td><b class="text1">AGE:</b></td>
	    		 <td><b class="text1">GENDER:</b></td>
	    		 <td><b class="text1">Delete</b></td>
	    		  <td><b class="text1">Edit</b></td>
		     </tr>
		     <c:forEach var="cust"  items="${customerForms}">
		     <tr>
	    		<td><b class="text1">${cust.userid}</b></td>
	    		 <td><b class="text1">${cust.name}</b></td>
	    		 <td><b class="text1">${cust.email}</b></td>
	    		 <td><b class="text1">${cust.mobile}</b></td>
	    		 <td><b class="text1">${cust.ssn}</b></td>
	    		 <td><b class="text1">${cust.age}</b></td>
	    		 <td><b class="text1">${cust.gender}</b></td>
	    		 <td><b class="text1"><a href="deleteCustomer.htm?id=${cust.id}">Delete</a></b></td>
	    		 <td><b class="text1"><a href="editCustomer.htm?id=${cust.id}">Edit</a></b></td>
		     </tr>
		     </c:forEach>
</table>

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