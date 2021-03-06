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
<meta charset="UTF-8"/ >
<link href="<%=request.getContextPath() %>/css/desibank.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/style.css"
	rel="stylesheet" type="text/css" />
	
	<script src="<%=request.getContextPath() %>/js/jquery-1.6.4.js"></script>
	<script src="<%=request.getContextPath() %>/js/jquery.validate.min1.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#form1").validate({
				rules: {
					code:{
						equalTo:'#confirmcode'
					}
				},
				messages: {
					code: "Confirm password must be same like password"
				},
				submitHandler: function(form) {
					 $(form).ajaxSubmit();
				}
			});
		});
	</script>
</head>

<body>
<jsp:include page="customerHeader.jsp" />


<div id="content">

<div id="right" style="width: 100%; height: 433">&nbsp;
<b> Funds Transfer- Other DesiBank Account across India</b> 
<hr />

<b> Add Payee - Confirmation Page</b>

<!-- form method="post" action="confirmDetails.htm" -->
<form method="post" action="finishConfirm.htm" id="form1" accept-charset=utf-8>
	<table border="0" align="center">

      <tr>	
		<td align="left"> Payee Account Number </td>
		<td align="left"> ${addPayeeInfo.payeeAccountNo} </td>
	  </tr>
      <tr>	
		<td align="left"> Payee Name </td>
		<td align="left"> ${addPayeeInfo.payeeName} </td>
	  </tr>
	   <tr>	
		<td align="left"> Payee Nick Name </td>
		<td align="left"> ${addPayeeInfo.payeeNickName} </td>
	  </tr>
	  <tr>
	  
	  <td align="left">You have been sent an 'activation code' to your email. Enter it here
	  <input type="text" value="${code}" name="confirmcode" id="confirmcode" style="display:none;"/></td>
	  <td align="left"><input type="text" name="code" id="code"/></td>
	  </tr> 
	  
	  <tr>
	   <td>
	   <input type="submit" value="Finish"/>
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
<p>Copyright � 2006 Sitename.com. Designed by <a
	href="http://www.freecsstemplates.org" class="link1">Free CSS
Templates</a> | Downloaded from <a href="http://www.cssbank.com/"><strong>Free
CSS Resource Bank</strong></a></p>
</div>
</body>
</html>