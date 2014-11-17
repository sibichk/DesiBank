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


<h3 align="center" ><font color="#FFFF00" face="Arial Black">Edit Details</font></h3>
	<p align="center" ><font color="white" face="Arial Black">
	
  
  <spring:form id="editCustomer"  method="POST" commandName="customer" > 
  
	<table border="0" align="center">
	
	
	  <tr>
			<td><b class="text1">User ID:</b></td>
			<td>
			<strong><b><input  type="text"  id="userid" name="userid" value="${customerForms.userid}" readonly="readonly" size="20" style="text1" /></b></strong></td>
		</tr>	
		
		<tr>
			<td><b class="text1">Password:</b></td>
			<td>
			<input type="password" id="password" name="password" value="${customerForms.password}" style="text1" readonly="readonly"/></td>
		</tr>
		
		<tr>
			<td><b class="text1">Name:</b></td>
			<td>
			<input  type="text"  id="name" name="name" value="${customerForms.name}"  size="20" style="text1" />
			</td>
		</tr>
		
		<tr>
			<td><b class="text1">Address:</b></td>
			<td>
			<textarea rows="2" cols="30" name="address"> <c:out value="${customerForms.address}" /> </textarea>
			</td>
		</tr>
		
		<tr>
			<td><b class="text1">Email:</b></td>
			<td>
			<input type="text" id="email" name="email" value="${customerForms.email}" style="text1" size="40"/></td>
		</tr>
		
		<tr>
			<td><b class="text1">Mobile:</b></td>
			<td>
			<input type="text" id="mobile" name="mobile" value="${customerForms.mobile}" style="text1" size="13"/></td>
		</tr>
		
		<tr>
			<td><b class="text1">SSN:</b></td>
			<td>
			<input type="text" id="ssn" name="ssn" value="${customerForms.ssn}" style="text1" size="13"/></td>
		</tr>
		
		<tr>
			<td><b class="text1">Age:</b></td>
			<td>
			<input type="text" id="age" name="age" value="${customerForms.age}" style="text1" size="13"/></td>
		</tr>
		
		<tr>
			<td><b class="text1">GENDER:</b></td>
			<td>
			<c:if  test="${customerForms.gender == 'male'}">
			   <select name="gender">
			    
			            <option value="male" selected="selected" >Male</option>
			            <option value="female" >Female</option>
			     </select>        
			 </c:if> 
			    
			  <c:if  test="${customerForms.gender == 'female'}">
			   <select name="gender">
			    
			            <option value="male"  >Male</option>
			            <option value="female"  selected="selected">Female</option>
			     </select>        
			 </c:if>
			   
			</td>
		</tr>
		
		<tr>
			<td><b class="text1">DOB:</b></td>
			<td>
			<input type="text" id="dob" name="dob" value="${customerForms.dob}" style="text1" size="13"/></td>
		</tr>
		
		<tr>
			<td><b class="text1">Father:</b></td>
			<td>
			<input type="text" id="father" name="father" value="${customerForms.father}" style="text1" size="13"/></td>
		</tr>
		
		<tr>
			<td><b class="text1">Qualification:</b></td>
			<td>
			<input type="text" id="qualification" name="qualification" value="${customerForms.qualification}" style="text1" size="13"/></td>
		</tr>
		
			<tr>
			<td><b class="text1">Job Title:</b></td>
			<td>
			<c:if test="${customerForms.jobTitle == 'Software Engg'}">
			   <select name="jobTitle">
			            <option value="Software Engg" selected="selected">Software Engg</option>
			            <option value="Business Man">Business Man</option>
			   </select>
			</c:if>  
			
			<c:if test="${customerForms.jobTitle == 'Business Man'}">
			   <select name="jobTitle">
			            <option value="Software Engg" >Software Engg</option>
			            <option value="Business Man" selected="selected">Business Man</option>
			   </select>
			</c:if> 
			
			</td>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="submit"
				value="UPDATE" id="sendData"/></td>
		</tr>
		
		
		<tr>

			<td colspan="2" align="center"><b><i><a href="<%=request.getContextPath() %>/home.htm" class="text1">New users? Register here.</a></i></b></td>
			
			<p align="center"><font size="3" color="red"><b>
			   <%=request.getAttribute("msg")!=null?request.getAttribute("msg"):""%>
			</b></font></p>
		</tr>
	</table>
</spring:form>
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