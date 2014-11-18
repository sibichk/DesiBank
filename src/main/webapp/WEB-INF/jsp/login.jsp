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
<link href='http://fonts.googleapis.com/css?family=Arvo' rel='stylesheet' type='text/css'>
<script src="<%=request.getContextPath() %>/js/jquery-1.6.4.js" type="text/javascript">
</script>

<script type="text/javascript">
 
   //initializing JDOM
   //ready is registring these function on
   //html DOM.
   $(document).ready(
	//anonymous method  
	 function() {
		
		 $("input,select").keyup(function(event){
			    if(event.keyCode == 13){
			        $("#sendData").click();
			    }
			});
		//click event on button
			$("#sendData").click(
					function() {
						//alert("I am here!");
						var userid=$("#userid").val();	
						var password=$("#password").val();
						if(userid.length==0){
						   alert("userid cannot be empty!");
						   $("#userid").focus();
						   return;
						}
						if(password.length==0){
							  alert("password cannot be empty!");
							  $("#password").focus();
							  return; 
						}

						var status=0;
						$.getJSON("${pageContext.request.contextPath}/ajaxCall.htm", { userid: userid,password:password}, function(jsonResponse) {
							 if(!jQuery.isEmptyObject(jsonResponse)) {
									 jQuery.each(jsonResponse, function(i, val) {
									  	 if(val=='valid') {
									  		status=1;
									  		 $('#vmessage').html('');
										  } else{
											  if(val!='invalid')
											   $('#vmessage').html(val);
											  // break;
										  }
									  	 //  $("input[type='radio'][id$='selectedAnswerId1']").val(val['answerId1']);
										  // $("input[type='radio'][id$='selectedAnswerId2']").val(val['answerId2']);
										   //$("input[type='radio'][id$='selectedAnswerId3']").val(val['answerId3']);
										   //$("input[type='radio'][id$='selectedAnswerId4']").val(val['answerId4']);
									});
									//submitting the html form to send the data
										if(status==1)
										$("#loginForm").submit();	
				       		 }  
				       	 });
						
						
				    }	
					
			);
		 //alert("Morning jQuery!");
     
	});

</script>

</head>
<body>
<div id="header"><img
	src="<%=request.getContextPath() %>/images/money2.jpg" width="100%"
	height="280"></img>
	<br><center style="font-size:20px; font-family: 'Arvo', serif; background:lightblue;"><b>Welcome To Online Desi@Bank </b></center>
	</div>
<div id="content">

<div id="right" style="width: 100%; height: 433">&nbsp;
<h3 align="center" ><font color="#FFFF00" face="Arial Black"><b>Login Screen</b></font></h3>
<p align="center"><font size="3" color="red"><b><span id="vmessage"></span>
			   <%=request.getAttribute("error")!=null?request.getAttribute("error"):""%>
			   <%=request.getParameter("error")!=null?request.getParameter("error"):""%>
			</b></font></p>

<form id="loginForm" action="validate.htm" method="post">
	<table border="0" align="center">
		<tr>
			<td><b class="text1">User ID:</b></td>
			<td>
			<strong><b><input  type="text"  id="userid" name="userid" size="20" style="text1" /></b></strong></td>
		</tr>
		<tr>
			<td><b class="text1">Password:</b></td>
			<td>
			<input type="password" id="password" name="password" style="text1"/></td>

		</tr>

		<tr>
			<td><b class="text1">Start in:</b></td>
			<td>
			  <select name="accoutType">
			  <option value="My Accounts">My Accounts</option>
			  <option value="Banks">Banks</option>
			  <option value="Credit Card">Credit Card</option>
			  <option value="Loan">Loan</option>
			  		  
			  </select>
			</td>
		</tr>

		<tr>
			<td colspan="2" align="right"><input type="button"
				value="Login-in" id="sendData"/></td>
		</tr>
		<tr>

				<td colspan="2" align="center"><b><i><a href="<%=request.getContextPath() %>/showCustomerRegistration.htm" class="text1"><img width="50" height="50" src=<%=request.getContextPath()%>/images/New-Customers-Registration.jpg></img>New users? Register here.</a></i></b></td>
			
			<p align="center"><font size="3" color="red"><b>
			   <%=request.getAttribute("msg")!=null?request.getAttribute("msg"):""%>
			   <%=request.getAttribute("emailMessage")!=null?request.getAttribute("emailMessage"):""%>
			</b></font></p>
		</tr>
	</table>
</form>
</div>
</div>
<p id="result"></p>
<br></br>

<div id="footer">
<p>Copyright © 2006 Sitename.com. Designed by <a
	href="http://www.freecsstemplates.org" class="link1">Free CSS
Templates</a> | Downloaded from <a href="http://www.cssbank.com/"><strong>Free
CSS Resource Bank</strong></a></p>
</div>
</body>
</html>