
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
				<li><a href="saleorder.jsp">Sele Order</a></li>
				<li><a href="salereport.jsp">Sale Report</a></li>
				<li class="active"><a href="account.jsp">Account</a></li>
			</ul>
		</nav>

		<!-- Main -->
		<div id="main">
			<section>
				<form action="" id="">
					<div class="fields">
						<div class="field">
							<label for="name">Name</label> <input type="text"
								name="name" id="updateFormName" />
						</div>
						<div class="field">
							<label for="email">Email</label> <input  type="email"
								name="email" id="updateFormEmail" />
						</div>
						<div class="field">
							<label for="password">Password</label> <input type="password"
								name="password" id="updateFormPassword" />
						</div>
						<div class="field">
							<label for="storeName">Store Name</label> <input type="text"
								name="storeName" id="updateFormStore" />
						</div>
						<div class="field">
							<label for="address">Store Address</label> <input type="text"
								name="address" id="updateFormAdrese" />
						</div>

					</div>
					<ul class="actions">
						<li><input type="button" value="Update Detail" id="updateUser" /></li>
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
		
	 window.onload = function() {
		 $.ajax({
	  	        type: "GET",
	  	        url: "<%=projectarticat%>/user/find/"+localStorage.getItem("ozoduserprofileUserId"),
				success : function(response) {
					$('#updateFormName').val(response.name);
					$('#updateFormEmail').val(response.email);
					$('#updateFormPassword').val(response.password);
					$('#updateFormStore').val(response.storeName);
					$('#updateFormAdrese').val(response.address);
				},error : function(error) {
					console.log(error);
				}
		 });
	 };
	 
	  $("#updateUser").click(function(e){
			 e.preventDefault();
		        var formData = {
		        		"id":localStorage.getItem("ozoduserprofileUserId"),
		        		"name":$('#updateFormName').val(),
						"email":$('#updateFormEmail').val(),
						"password":$('#updateFormPassword').val(),
						"storeName":$('#updateFormStore').val(),
						"address":$('#updateFormAdrese').val()
			    }
		        $.ajax({
		  	        type: "PUT",
		  	        url: "<%=projectarticat %>/user/update",
		  	        data: JSON.stringify(formData),
		  	        processData: false,
			        datatype : "application/json",
		            contentType: "application/json",
		  	        success: function (response) {
		  	        	alert("Account Updated.")
		  	        	$('#updateFormName').val(response.name);
						$('#updateFormEmail').val(response.email);
						$('#updateFormPassword').val(response.password);
						$('#updateFormStore').val(response.storeName);
						$('#updateFormAdrese').val(response.address);
		  	        },
		  	        error: function (error) {
		  	        	consol.log(error);
		  	        }
		  	      });
		});	//$("#loginButtonSubmitId")
			
			
	 
  });//$(function(){
	  

	
	  
  </script>

</body>
</html>