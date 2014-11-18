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
<link href="<%=request.getContextPath() %>/css/all.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="customerHeader.jsp" />
<div id="content">
	<img src="${pageContext.request.contextPath}/showPhotoById.htm?id=${detail.id}"></img>
	<a href="editProfile.do?fid=${detail.userid}">Edit profile</a>
	<div id="user_profile">
		<%-- 
		<label for="id"><span class="label">User id:</span><h3 id="id">${detail.userid}</h3></label></br>
		<label for="name"><span class="label">Name:</span><h3 id="name">${detail.name}</h3></label></br>
		<label for="address"><span class="label">Address:</span><h3 id="address">${detail.address}</h3></label></br>
		<label for="email"><span class="label">Email:</span><h3 id="email">${detail.email}</h3></label></br>
		<label for="mobile"><span class="label">Mobile:</span><h3 id="mobile">${detail.mobile}</h3></label></br>
		<label for="dob"><span class="label">DOB:</span><h3 id="dob">${detail.dob}</h3></label></br>
		<label for="qualification"><span class="label">User id:</span><h3 id="qualification">${detail.qualification}</h3></label></br>
		<label for="title"><span class="label">User id:</span><h3 id="title">${detail.jobTitle}</h3></label></br> --%>
		User id : ${detail.userid} </br>
		Name: ${detail.name}</br>
		Address: ${detail.address}</br>
		Email: ${detail.email}</br>
		Contact no: ${detail.mobile}</br>
		Date of Birth: ${detail.dob}</br>
		Qualification: ${detail.qualification}</br>
		Job Position: ${detail.jobTitle}
	
	</div>
	<div id="scroll">
	<marquee  scrollamount="2" direction="up" loop="true" width="1070">			
		<font color="white" face="Trebuchet MS">			
			<b><p>1. <u>Desi Bank</u> offers wide variety of Loans Products to suit your requirements.Coupled with convenience of networked branches/ ATMs and facility of E-channels like Internet and Mobile Banking, <p/><p>2. <u>Desi Bank</u> brings banking at your doorstep. Select any of our loan product and provide your details online and our representative will contact you for getting loans.
			Home Loans
			The No. 1 Home Loans Provider in the country, </p><p>3. <u>Desi Bank</u> Home Loans offers some unbeatable benefits to its customers - Doorstep Service, Simplified Documentation and Guidance throughout the Process. It's really easy ! </p>
			</b>
		</font>
	</marquee>
	</div>
</div>



<div id="footer">
<p>Copyright © 2006 Sitename.com. Designed by <a
	href="http://www.freecsstemplates.org" class="link1">Free CSS
Templates</a> | Downloaded from <a href="http://www.cssbank.com/"><strong>Free
CSS Resource Bank</strong></a></p>
</div>
</body>
</html>