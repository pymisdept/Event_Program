<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Form_en.aspx.cs" Inherits="Form_en" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
	<title>Health Declaration Form</title>
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
				<form class="contact3-form validate-form" method="post" id="myForm" name="myForm" action="Confirm.aspx" runat="server" >
				
				
				  <div class="form-group row">
					<div class="col-6">
					    <img src="images\logo.png" width="250"/>
					</div>
					<div class="col-6" style="text-align: right">
					   <asp:HyperLink ID="hyperlink" href='#' runat="server" class="btn btn-outline-secondary" role="button" aria-pressed="true" style="margin-top: 10px;">中文</asp:HyperLink>
					</div>
					
				 </div>
				 
						<span style="color:black">
						<h2>Health Declaration Form</h2>
						<br />		
						Before entering our site, please fill in the declaration form below.
						</span>
						<br />
						<br />
					    <span style="font-size: 16pt">Site ﹕ </span><b><u><span id="site_location" runat="server" style="font-size: 16pt"></span></u></b>
					    <asp:HiddenField ID="site_id" runat="server" />
					<hr />
					
				  <div class="form-group row">
					<label for="rd_title" class="col-sm-3 col-form-label">Salutation ﹕<span style="color:red">*</span></label>
					<div class="col-sm-9">
					  <div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-info">
							<input type="radio" name="salutation" id="Radio1" value="Mr" autocomplete="off" required>Mr.</input>
						  </label>
						  <label class="btn btn-outline-info">
							<input type="radio" name="salutation" id="Radio2"  value="Ms" autocomplete="off" required>Ms.</input>
						  </label>
						</div>
					</div>
				 </div>
					
				   <div class="form-group row">
					<label for="name" class="col-sm-3 col-form-label">Name ﹕<span style="color:red">*</span></label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="name" name="name" placeholder="" maxlength="100" required />
					</div>
				  </div>
				  
				   <div class="form-group row">
					<label for="comp" class="col-sm-3 col-form-label">Company Name ﹕<span style="color:red">*</span></label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="comp" name="comp" placeholder="" maxlength="100" required />
					</div>
				  </div>
				  
				   <div class="form-group row">
					<label for="tel" class="col-sm-3 col-form-label">Contact Number ﹕<span style="color:red">*</span></label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="tel" name="tel" placeholder="" maxlength="100" required />
					</div>
				  </div>
				  
				   <div class="form-group row">
					<label for="post" class="col-sm-3 col-form-label">Job Title ﹕</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="post" name="post" placeholder="" maxlength="100" />
					</div>
				  </div>
				  
				 
					<hr />
					
					<div class="form-group row">
						<label for="q1" class="col-12 col-form-label">1. Have you travelled outside Hong Kong in the past 14 days? <span style="color:red">*</span></label>
						<div class="col-12">
					  <div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-info">
							<input type="radio" name="q1" value="Y" autocomplete="off" required>Yes</input>
						  </label>
						  <label class="btn btn-outline-info">
							<input type="radio" name="q1" value="N" autocomplete="off" required>No</input>
						  </label>
						</div>
					</div>
					</div>
					
					
					<div class="form-group row">
						<label for="q2" class="col-12 col-form-label">2. Are you currently under compulsory quarantine or medical surveillance order by the Department of Health of Hong Kong? <span style="color:red">*</span></label>
						<div class="col-12">
					  <div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-info">
							<input type="radio" name="q2" value="Y" autocomplete="off" required>Yes</input>
						  </label>
						  <label class="btn btn-outline-info">
							<input type="radio" name="q2" value="N" autocomplete="off" required>No</input>
						  </label>
						</div>
					</div>
					</div>
					
					<div class="form-group row">
						<label for="q3" class="col-12 col-form-label">3. Have you been in close contact with confirmed case(s) and/or preliminarily tested positive case(s) of COVID-19 in the past 14 days? <span style="color:red">*</span></label>
						<div class="col-12">
					  <div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-info">
							<input type="radio" name="q3" value="Y" autocomplete="off" required>Yes</input>
						  </label>
						  <label class="btn btn-outline-info">
							<input type="radio" name="q3" value="N" autocomplete="off" required>No</input>
						  </label>
						</div>
					</div>
					</div>
					
					<div class="form-group row">
						<label for="q4" class="col-12">4. Have you lived with any person under home quarantine in the past 14 days? <span style="color:red">*</span></label>
						<div class="col-12">
					  <div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-info">
							<input type="radio" name="q4" value="Y" autocomplete="off" required>Yes</input>
						  </label>
						  <label class="btn btn-outline-info">
							<input type="radio" name="q4" value="N" autocomplete="off" required>No</input>
						  </label>
						</div>
					</div>
					</div>			
											
					<div class="form-group row">
						<label for="q5_1" class="col-12">5. Have you completed <span style="color:#323edd"><b>the second dose of COVID-19 vaccine</b></span> and has been more than 14 days? <span style="color:red">*</span></label>
						<div class="col-12">
					  <div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-info">
							<input type="radio" name="q5_1" value="Y" autocomplete="off" required>Yes</input>
						  </label>
						  <label class="btn btn-outline-info">
							<input type="radio" name="q5_1" value="N" autocomplete="off" required>No</input>
						  </label>
						</div>
					</div>
					</div>
					
					<div id="q6div" class="form-group row" style="display: none">
						<label for="q6" class="col-12">6. Do you have <b><u>a valid negative COVID-19 test result</u></b> conducted within the past 14 days? <span style="color:red">*</span></label>
						<div class="col-12">
					  <div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-info">
							<input type="radio" name="q6" value="Y" autocomplete="off" required>Yes</input>
						  </label>
						  <label class="btn btn-outline-info">
							<input type="radio" name="q6" value="N" autocomplete="off" required>No</input>
						  </label>
						</div>
					</div>
					</div>
					
					<div class="form-group row" style="margin-left: 0px; margin-right: 0px; ">
						<div class="col-12" style="border-left: 6px solid #17a2b8; background-color: #e7f3fe; padding: 4px 12px;">Please note you should carry the proof in anytime for checking.</div>
					</div>
					
					<hr />
					
					<div class="form-group row">
						<div class="col-12" style="text-align:center">							
							  <input class="" type="checkbox" id="declare" value="option1" style="width: 20px;  height: 20px;" required >							
						</div>
						<label for="declare" class="col-12 col-form-label" style="text-align:center"> <span style="color:red">*</span> I hereby declare that all the information given above is true and correct.</label>
					</div>
					
					
					<div class="form-group row">
						<div class="col-12" style="text-align:left">							
							 <u><b>COVID-19 - Personal Information Collection Statement</b></u>
						</div>
						<span class="col-12 col-form-label" style="font-size:10pt; text-align: justify">Personal data collected in this Health Declaration Form is for the purpose of helping monitor and prevent the spread of COVID-19. Such data, which includes your name, company name, phone number and health condition, may be used for tracking and tracing potential virus carriers and may need to be transferred and disclosed to the Department of Health and other public health authorities for protecting public health. The data is required to approve your entry to our site and refusal to provide such data may result in your being denied entry to our site. The collection, retention and use of your personal data will be in strict compliance with the requirements of the Personal Data (Privacy) Ordinance (Cap. 486).</span>
					</div>
					
					
					<div class="form-group row">
						<button class="btn btn-success" style="padding: 10px; width: 100vw;" id="submitBtn">
							Submit
						</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>

	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <script src="vendor/datepicker/bootstrap-datepicker.min.js" type="text/javascript"></script>
    <script src="js/form.js?timestamp=202104151654" type="text/javascript"></script>
</body>
</html>
