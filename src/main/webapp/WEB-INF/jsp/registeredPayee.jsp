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
<jsp:include page="customerHeader.jsp" />
<div id="content">

<div id="right" style="width: 100%; height: 433">&nbsp;
<hr />


<h3 align="center" ><font color="#FFFF00" face="Arial Black">Customers Data</font></h3>
	<p align="center" ><font color="white" face="Arial Black">
	
  <table border="1" align="center">
			<tr>
	    		 <td><b class="text1">Name:</b></td>
	    		 <td><b class="text1">Account No.:</b></td>
	    		 <td><b class="text1">Delete</b></td>
	    		  <td><b class="text1">Edit</b></td>
		     </tr>
		     <c:forEach var="payee"  items="${payeeWebForm}">
		     <tr>
	    		 <td><b class="text1">${payee.payeeName}</b></td>
	    		 <td><b class="text1">${payee.payeeAccountNo}</b></td>
	    		 <td><b class="text1"><a href="deletePayee.htm?id=${payee.payeeAccountNo}">Delete</a></b></td>
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