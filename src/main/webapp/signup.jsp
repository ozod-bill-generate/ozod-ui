
<%@ page import="java.util.ResourceBundle"%>
<%
ResourceBundle resource = ResourceBundle.getBundle("config");
String projectarticat = resource.getString("project.artifact");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Ozod Solutions</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Header -->
		<header id="header">
			<a href="index.html" class="logo">Ozod</a>
		</header>
		<nav id="nav">
			<ul class="links">
				<li class="active"><a href="signup.jsp">Signup</a></li>
				<li><a href="index.jsp">Login</a></li>
			</ul>
		</nav>

		<!-- Main -->
		<div id="main">
			<section>
				<form action="" id="signupForm">
					<div class="fields">
						<div class="field">
							<label for="name">Name</label> <input id="signupFormuser"
								type="text" name="name" id="name" />
						</div>
						<div class="field">
							<label for="mobile">Mobile</label> <input id="signupFormmobile"
								type="text" name="mobile" id="mobile" />
						</div>
						<div class="field">
							<label for="password">Password</label> <input
								id="signupFormpassowrd" type="text" name="password"
								id="password" />
						</div>
						<div class="field">
							<label for="storeName">StoreName</label> <input
								id="signupFormstorename" type="text" name="storeName"
								id="storeName" />
						</div>

					</div>
					<ul class="actions">
						<li><input type="button" value="Signup" id="signupUser" /></li>
					</ul>
				</form>
			</section>
		</div>

		<!-- Footer -->
		<footer id="footer"> </footer>

		<!-- Copyright -->
		<div id="copyright">
			<ul>
				<li>&copy; Nikhil</li>
				<li>Design: <a href="">Ozod</a></li>
			</ul>
		</div>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script type="text/javascript">
	$(function(){
		
	  $("#signupUser").click(function(e){
			 e.preventDefault();
		        var formData = {
		        		"name":$('#signupFormuser').val(),
						"mobile":$('#signupFormmobile').val(),
						"password":$('#signupFormpassowrd').val(),
						"storeName":$('#signupFormstorename').val()
			    }
		        $.ajax({
		  	        type: "POST",
		  	        url: "<%=projectarticat %>/user/add",
		  	        data: JSON.stringify(formData),
		  	        processData: false,
			        datatype : "application/json",
		            contentType: "application/json",
		  	        success: function (response) {
		  	        	console.log(response);
		  	        	localStorage.setItem("ozoduserprofile", response);
		  	        	alert("User Created");
		  	        	window.location ="index.jsp"
		  	        },
		  	        error: function (error) {
		  	        	if(error.responseJSON.msg == undefined){
		  	        		alert(error.responseJSON.error);
		  	        	}else{
		  	        		 alert(error.responseJSON.msg);
		  	        	}
		  	         
		  	        }
		  	      });
		});	//$("#loginButtonSubmitId")
			
			
	 
  });//$(function(){
	  
	
	  
  </script>

</body>
</html>