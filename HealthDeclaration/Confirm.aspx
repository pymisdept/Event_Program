<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Confirm.aspx.cs" Inherits="Confirm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
	<title>個人健康申報表</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=11"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>

	<div class="bg-contact3" style="background-image: url('images/pye_background_image.png');">
		<div class="container-contact3">
			<div class="wrap-contact4">
				<form class="contact3-form validate-form" method="post" id="myForm" name="myForm">
					<img src="images\logo.png" width="250"/>
					    <br /><br />
						<span style="color:black">
						<h2>個人健康申報表 Health Declaration Form</h2>						
						<hr />
						    <span runat="server" id="message"></span>
						    <br />						    						    
						</span>
						
						<div style="text-align: center">
						    <asp:Image ID="image1" runat="server" ImageAlign="Middle" ImageUrl="~/images/cross.png" />
						    <br />
						     <span runat="server" id="lastdate" /> 
						</div>
					
				</form>
			</div>
		</div>
	</div>

	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!-- <script src="js/main.js?timestamp=201907241536"></script> -->

</body>
</html>
