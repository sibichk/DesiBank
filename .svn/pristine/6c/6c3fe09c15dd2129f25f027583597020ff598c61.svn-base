<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="<%=request.getContextPath() %>/css/desibank.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/style.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/all.css"
	rel="stylesheet" type="text/css" />
	<script src="<%=request.getContextPath() %>/js/jquery-1.6.4.js"></script>
	<script src="<%=request.getContextPath() %>/js/jquery.validate.min1.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#form1").validate({
				rules: {
					
					ans1:{
						required:true
					},
					ans2:{
						required:true
					},
					new_pass: {
						 required: true,
						 minlength: 8
					 },
					 conf_pass: {
						 required:true,
						 equalTo : "#new_pass"
						 
					 }
				},
				messages:  {
					
					ans1:{
						required: "Please enter the answer"
					},
					ans2:{
						required: "Please enter the answer"
					},
					new_pass: {
						required: "Please enter a password",
						minlength: "Password must be 8 character long"
					},
					conf_pass: "Confirm password must be same like password"
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
		<form id="form1" method="post" action="${pageContext.request.contextPath}/changePass.htm">
			${qn1} <input type="text" id="ans1" name="ans1"><br>
			${qn2}<input type="text" id="ans2" name="ans2"><br>
			Enter new password <input type="password" id="new_pass" name="new_pass"><br>
			Confirm new password <input type="password" id="conf_pass" name="conf_pass"><br>
			<input type="hidden" value="${qn1}" name="qn1">
			<input type="hidden" value="${qn2}" name="qn2">
			
			<input type="submit" value="Change Password">
		</form>
</div>
<div id="footer">
<p>Copyright Â© 2006 Sitename.com. Designed by <a
	href="http://www.freecsstemplates.org" class="link1">Free CSS
Templates</a> | Downloaded from <a href="http://www.cssbank.com/"><strong>Free
CSS Resource Bank</strong></a></p>
</div>
</body>
</html>