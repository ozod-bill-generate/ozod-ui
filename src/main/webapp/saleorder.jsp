
<%@ page import="java.util.ResourceBundle"%>
<%
ResourceBundle resource = ResourceBundle.getBundle("config");
String projectarticat = resource.getString("project.artifact");
%>
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Ozod Solutions</title>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/ozod.css" />
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
</style>
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper" class="fade-in">

		<!-- Intro -->
		<div id="intro">
			<h1>
				Ozod<br /> Solutions
			</h1>
			<ul class="actions">
				<li><a href="#header"
					class="button icon solid solo fa-arrow-down scrolly">Continue</a></li>
			</ul>
		</div>

		<!-- Header -->
		<header id="header">
			<a href="index.html" class="logo">Ozod</a>
		</header>

		<!-- Nav -->
		<nav id="nav">
			<ul class="links">
				<li class="active"><a href="saleorder.jsp">Sele Order</a></li>
				<li><a href="salereport.jsp">Sale Report</a></li>
				<li><a href="account.jsp">Account</a></li>
				<!-- <li><a href="elements.jsp">Elements Reference</a></li> -->
			</ul>
		</nav>

		<!-- Main -->
		<div id="main">
			<section class="posts">
				<article>
					<form action="">
						<div class="fields">
							<div class="field custom-select">
								<label for="productname">Product Type</label> <select
									ame="productname" id="productname">
									<option value="0">उत्पाद प्रकार चुने:</option>
									<option value="A">अनाज</option>
									<option value="D">दाल</option>
									<option value="KM">खड़ा-मसाला</option>
									<option value="M">पाउडर मसाले</option>
									<option value="T">तेल</option>
									<option value="O">अन्य</option>
								</select>
							</div>
							<div class="field custom-select">
								<label for="itemname">Product</label> <select name="itemname"
									id="itemnameoptions">
									<option value="NA">उत्पाद चुने:</option>
								</select>
							</div>
							<div class="field">
								<button id="priceButton">Price</button>
								<button id="kgButton">Per/Kg</button>
								<button id="gramButton">Per/Gram</button>
							</div>
							<div class="field" id="salePriceIdField">
								<label for="price">Price</label> <input type="text" name="price"
									id="salePriceId" />
							</div>
							<div class="field" id="salequantityInKgIdField">
								<label for="quantity">Quantity In Kg</label> <input type="text"
									name="quantity" id="salequantityInKgId" />
							</div>
							<div class="field" id="salequantityInGramIdField">
								<label for="priceingram">Quantity In Gram</label> <input
									type="text" name="priceingram" id="salequantityInGramId" />
							</div>
							<div class="field" id="saleInKgField">
								<label for="priceinkg">Price/Kg</label> <input type="text"
									name="priceinkg" id="saleInKg" />
							</div>

						</div>
						<ul class="actions" id="addInBillSaleOrder">
							<li><input type="submit" value="Add in Bill" /></li>
						</ul>
					</form>
				</article>
				<article id="billArticalId">
					<header>
						<!-- <span class="date">April 7, 2017</span> -->
						<h2>
							<a> Total Bill </a>
						</h2>
					</header>
					<br>
					<!-- 
					<a href="#" class="image fit"><img src="images/pic07.jpg"
						alt="" /></a>
					<p>Donec eget ex magna. Interdum et malesuada fames ac ante
						ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet
						dolor mattis sagittis magna etiam.</p> -->
					<!-- <ul class="actions special">
						<li><a href="#" class="button">Bill</a></li>
					</ul> -->
					<form action="">
						<div class="fields">
							<table class="table fields" id="billTableId">
								<thead>
									<tr>
										<th scope="col">S.N</th>
										<th scope="col">Product</th>
										<th scope="col">Quantity</th>
										<th scope="col">Price</th>
										<th scope="col">Remove</th>
									</tr>
								</thead>
								<tbody id="tbodyIdForAllProductAdded">
								</tbody>
							</table>

							<table class="table fields">
								<thead>
									<tr>
										<th scope="col">Total Price</th>
										<th scope="col" id="totalFinalPrice"></th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>

						</div>

					</form>
					<ul class="fields actions">
						<li><input type="submit" value="Get Bill"
							id="downloadPdfBill" /></li>
						<!-- <li><input value="Send Bill to customer" /></li> -->
					</ul>
				</article>
			</section>


		</div>


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
	
	var totalPrice = 0;
	var serialNo = 0;
  $(function(){
	  $("#salePriceIdField").hide();
	  $("#salequantityInKgIdField").hide();
	  $("#salequantityInGramIdField").hide();
	  $("#saleInKgField").hide();
	  if(serialNo == 0){
		  $("#billArticalId").hide();
	  }else{
		  $("#billArticalId").show();
	  }
	  
	  $("#priceButton").click(function(e) {
			e.preventDefault();
			$('#salePriceId').val("");
			$('#salequantityInKgId').val("");
			$('#salequantityInGramId').val("");
			$('#saleInKg').val("");
			
			$("#salePriceIdField").show();
		    $("#salequantityInKgIdField").hide();
		    $("#salequantityInGramIdField").hide();
		    $("#saleInKgField").hide();
		});

		$("#kgButton").click(function(e) {
			e.preventDefault();
			$('#salePriceId').val("");
			$('#salequantityInKgId').val("");
			$('#salequantityInGramId').val("");
			$('#saleInKg').val("");
			
			$("#salequantityInKgIdField").show();
			$("#saleInKgField").show();
		    $("#salePriceIdField").hide();
		    $("#salequantityInGramIdField").hide();
		});

		$("#gramButton").click(function(e) {
			e.preventDefault();
			$('#salePriceId').val("");
			$('#salequantityInKgId').val("");
			$('#salequantityInGramId').val("");
			$('#saleInKg').val("");
			
			$("#salequantityInGramIdField").show();
		    $("#saleInKgField").show();
			$("#salequantityInKgIdField").hide();
		    $("#salePriceIdField").hide();
		});
		
		
		$("#addInBillSaleOrder").click(function(e) {
			e.preventDefault();
			if($('#itemnameoptions option:selected').val() != "NA"){
				var productName = $('#itemnameoptions option:selected')[0].innerHTML;
				var productType = $('#itemnameoptions option:selected')[0].attributes[0].value;
				var productNameId = $('#itemnameoptions option:selected')[0].value;
				
				var price = $('#salePriceId').val();
				if(price == "" || price == undefined){
					var pricePerKg = $('#saleInKg').val();
					var quantityInKg = $('#salequantityInKgId').val();
					if(quantityInKg == "" || quantityInKg == undefined){
						var quantityInGram = $('#salequantityInGramId').val();
						if(quantityInGram == "" || quantityInGram == undefined){
							alert("कृपया कीमत या मात्रा जोड़े|");
						}else{
							//gram
							if(pricePerKg == "" || pricePerKg == undefined){
								alert("कृपया कीमत जोड़े|");
							}else{
								serialNo+= 1;
								var price1 = (pricePerKg/1000*quantityInGram);
								totalPrice = parseInt(totalPrice, 10)  + parseInt(price1, 10);
								$("#billTableId tbody").append('<tr><th id="addedRecord'+serialNo+'" scope="row">'+serialNo+'</th><td productType="'+productType+'" productNameId="'+productNameId+'">'+productName+'</td><td>'+quantityInGram+' Gram</td><td>Rs. '+price1+'</td><td><i name="'+price1+'" onclick="removeItem(this)" class="fa fa-close" style="color: red"></i></td></tr>');
							}
							
						}
					}else{
						//In Kg
						if(pricePerKg == "" || pricePerKg == undefined){
							alert("कृपया कीमत जोड़े|");
						}else{
							serialNo+= 1;
							var price2 = (pricePerKg*quantityInKg);
							totalPrice = parseInt(totalPrice, 10)  + parseInt(price2, 10);
							$("#billTableId tbody").append('<tr><th id="addedRecord'+serialNo+'" scope="row">'+serialNo+'</th><td productType="'+productType+'" productNameId="'+productNameId+'">'+productName+'</td><td>'+quantityInKg+' Kg</td><td>Rs. '+price2+'</td><td><i name="'+price2+'" onclick="removeItem(this)" class="fa fa-close" style="color: red"></i></td></tr>');
						}
					}
					
				}else{
					serialNo+= 1;
					totalPrice = parseInt(totalPrice, 10)  + parseInt(price, 10);
					$("#billTableId tbody").append('<tr><th id="addedRecord'+serialNo+'" scope="row">'+serialNo+'</th><td productType="'+productType+'" productNameId="'+productNameId+'">'+productName+'</td><td></td><td>Rs. '+price+'</td><td><i name="'+price+'" onclick="removeItem(this)" class="fa fa-close" style="color: red"></i></td></tr>');
				}
			}else{
				alert("कृपया पहले उत्पाद चुने |");
			}
			$("#totalFinalPrice")[0].innerHTML=totalPrice+"/- Rupees only.";
			if(serialNo == 0){
				  $("#billArticalId").hide();
			}else{
				  $("#billArticalId").show();
			}
			//$("#totalFinalPrice").val(totalPrice);				
		});
		
	  $("#productname").change(function(e){
			 e.preventDefault();
			 $('#itemnameoptions').children().remove();
			 var productName = $('#productname').val();
		        if(productName != ""){
		        	$.ajax({
			  	        type: "GET",
			  	        url: "<%=projectarticat%>/product/"
										+ productName,
								success : function(response) {
									$.each(response, function(i, item) {
										$('#itemnameoptions').append('<option productType="'+productName+'" value="'+i+'">' + item.name+ '</option>');
									});
								},
								error : function(error) {
									console.log(error);
								}
							});
						}
					}); //$("#productname")
		$("#downloadPdfBill").click(function(e){
			e.preventDefault();
			var formData = {
		        	"userId": localStorage.getItem("ozoduserprofileUserId"),
		        	"saleOrder": [
		        		
		        	]
			}
			$("#tbodyIdForAllProductAdded").children().each(function (i,item) {
				var element = $(this).prop('outerHTML');
				
				var productType='';
				var productNameId='';
				var productName='';
				var quantity ='';
				var price ='';
				$(this).children('td').each(function (i,item) {
					if(i==0){
						productName = $(this).html();
						productType = $(this)[0].attributes.producttype.value;
						productNameId= $(this)[0].attributes.productnameid.value;
					}if(i==1){
						quantity = $(this).html();
					}if(i==2){
						price = $(this).html();
					}
				});
				
				console.log(productName +" :: "+quantity+" :: "+price+" :: "+productType+" :: "+productNameId);
				
				if(quantity==null || quantity==""){
					formData.saleOrder.push({"product_name": productName,"productType": productType,"productNameId": productNameId,"price": price})
				}else{
					formData.saleOrder.push({"product_name": productName,"productType": productType,"productNameId": productNameId,"quantity": quantity,"price": price})
				}
				
			});
			console.log(formData);
			$.ajax({
				type: "POST",
	            xhrFields: {
	              responseType: 'blob'
	            },
	  	        url: "<%=projectarticat%>/report/pdf/generate",
	  	        data: JSON.stringify(formData),
	  	        processData: false,
		        datatype : "application/json",
	            contentType: "application/json",
				success : function(result) {
								let blob = new Blob([result], { type: "application/octetstream" }); 
                                console.log(blob);
						        let a = document.createElement('a');
						        a.href = window.URL.createObjectURL(blob);
						        
						        const today = new Date();
						        const yyyy = today.getFullYear();
						        let mm = today.getMonth() + 1; 
						        let dd = today.getDate();
						        
						        a.download = "Bill_"+mm+"_"+dd+"_"+yyyy+".pdf";;
						        document.body.appendChild(a);
						        a.click();
						        document.body.removeChild(a);
						        window.URL.revokeObjectURL(a.href);
				},
				error : function(error) {
								console.log(error);
				}
		     });
		  });
					
					
					
					
					
					
					

		});//$(function(){

		var removeItem = function(object) {
			var tempserialNo = object.parentElement.parentElement.firstElementChild.innerHTML;

			var price = object.attributes.name.nodeValue;
			var newPrice = parseInt(totalPrice, 10) - parseInt(price, 10);
			$("#totalFinalPrice")[0].innerHTML = newPrice + "/- Rupees only.";
			totalPrice = newPrice;
			serialNo = parseInt(serialNo, 10) - 1;
			object.parentElement.parentElement.remove();
			if (serialNo == 0) {
				$("#billArticalId").hide();
			} else {
				$("#billArticalId").show();
			}
			console.log(serialNo);
			for (var i = tempserialNo, len = 50; i < len; i++) {
				var tempV = parseInt(i, 10) + parseInt(1, 10);
				document.getElementById("addedRecord" + tempV).innerHTML = i;
				document.getElementById("addedRecord" + tempV).id = "addedRecord"
						+ i;
			}
		};
		
	</script>




</body>
</html>