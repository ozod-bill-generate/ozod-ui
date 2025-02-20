 <%@ page import = "java.util.ResourceBundle" %>
 <% ResourceBundle resource = ResourceBundle.getBundle("config");
    String projectarticat=resource.getString("project.artifact");
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
				<li class="active"><a href="index.jsp">Login</a></li>
				<li><a href="signup.jsp">Signup</a></li>
			</ul>
		</nav>

		<!-- Main -->
		<div id="main">
			<section>
				<form method="post" action="#">
					<div class="fields">
						<div class="field">
							<label for="mobile">Mobile</label> <input type="text" name="mobile"
								id="loginFormmobile" />
						</div>
						<div class="field">
							<label for="password">Password</label> <input type="text" name="password"
								id="loginFormpassowrd" />
						</div>
					</div>
					<ul class="actions">
						<li><input type="button" value="Login" id="loginbutton" /></li>
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
	  var user=localStorage.getItem("ozoduserprofileUserId");
		if(user != undefined || user != "null" || user != ""){
			window.location ="saleorder.jsp";
		}
		
	  $("#loginbutton").click(function(e){
			 e.preventDefault();
		        var formData = {
						"mobile":$('#loginFormmobile').val(),
						"password":$('#loginFormpassowrd').val(),
			    }
		        $.ajax({
		  	        type: "POST",
		  	        url: "<%=projectarticat %>/user/login",
		  	        data: JSON.stringify(formData),
		  	        processData: false,
			        datatype : "application/json",
		            contentType: "application/json",
		  	        success: function (response) {
		  	        	localStorage.setItem("ozoduserprofile", response);
		  	        	localStorage.setItem("ozoduserprofileUserId", response.id);
		  	        	window.location ="saleorder.jsp"
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