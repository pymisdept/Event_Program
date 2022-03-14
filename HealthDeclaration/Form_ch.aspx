<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Form_ch.aspx.cs" Inherits="Form_ch" %>

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
	
	<!-- Latest compiled and minified CSS -->

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
    <link href="vendor/datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
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
					   <asp:HyperLink ID="hyperlink" href='#' runat="server" class="btn btn-outline-secondary" role="button" aria-pressed="true" style="margin-top: 10px;">Eng</asp:HyperLink>
					</div>
					
				 </div>
						<span style="color:black">
						<h2>個人健康申報表</h2>
						<br />
						進入地盤前，請填寫以下健康申報表並量度體溫
						</span>
						<br />
						<br />
					    <span style="font-size: 16pt">地盤 : </span><b><u><span id="site_location" runat="server" style="font-size: 16pt"></span></u></b>
					    <asp:HiddenField ID="site_id" runat="server" />
					<hr />
					
				  <div class="form-group row">
					<label for="rd_title" class="col-sm-3 col-form-label">稱謂 ﹕<span style="color:red">*</span></label>
					<div class="col-sm-9">
					  <div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-info">
							<input type="radio" name="salutation" id="Radio1" value="Mr" autocomplete="off" required>先生</input>
						  </label>
						  <label class="btn btn-outline-info">
							<input type="radio" name="salutation" id="Radio2"  value="Ms" autocomplete="off" required>小姐</input>
						  </label>
						</div>
					</div>
				 </div>
					
				   <div class="form-group row">
					<label for="name" class="col-sm-3 col-form-label">姓名 ﹕<span style="color:red">*</span></label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="name" name="name" placeholder="" maxlength="100" required />
					</div>
				  </div>
				  
				   <div class="form-group row">
					<label for="comp" class="col-sm-3 col-form-label">公司名稱 ﹕<span style="color:red">*</span></label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="comp" name="comp" placeholder="" maxlength="100" required />
					</div>
				  </div>
				  
				   <div class="form-group row">
					<label for="tel" class="col-sm-3 col-form-label">聯絡電話 ﹕<span style="color:red">*</span></label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="tel" name="tel" placeholder="" maxlength="100" required />
					</div>
				  </div>
				  
				   <div class="form-group row">
					<label for="post" class="col-sm-3 col-form-label">職銜 ﹕</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="post" name="post" placeholder="" maxlength="100" />
					</div>
				  </div>
				  
				 
					<hr />
					
					<div class="form-group row">
						<label for="q1" class="col-12 col-form-label">1. 你在過去14天內是否曾到訪香港以外地方？<span style="color:red">*</span></label>
						<div class="col-12">
					  <div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-info">
							<input type="radio" name="q1" value="Y" autocomplete="off" required>是</input>
						  </label>
						  <label class="btn btn-outline-info">
							<input type="radio" name="q1" value="N" autocomplete="off" required>否</input>
						  </label>
						</div>
					</div>
					</div>
					
					
					<div class="form-group row">
						<label for="q2" class="col-12 col-form-label">2. 你是否現正接受香港衞生署的強制檢疫或醫學監察安排？<span style="color:red">*</span></label>
						<div class="col-12">
					  <div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-info">
							<input type="radio" name="q2" value="Y" autocomplete="off" required>是</input>
						  </label>
						  <label class="btn btn-outline-info">
							<input type="radio" name="q2" value="N" autocomplete="off" required>否</input>
						  </label>
						</div>
					</div>
					</div>
					
					<div class="form-group row">
						<label for="q3" class="col-12 col-form-label">3. 你是否在過去14天內曾與2019冠狀病毒病確診個案及╱或疑似個案的患者有密切接觸？ <span style="color:red">*</span></label>
						<div class="col-12">
					  <div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-info">
							<input type="radio" name="q3" value="Y" autocomplete="off" required>是</input>
						  </label>
						  <label class="btn btn-outline-info">
							<input type="radio" name="q3" value="N" autocomplete="off" required>否</input>
						  </label>
						</div>
					</div>
					</div>
					
					<div class="form-group row">
						<label for="q4" class="col-12">4. 你是否在過去14天內曾與正在接受家居檢疫的人士同住？ <span style="color:red">*</span></label>
						<div class="col-12">
					  <div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-info">
							<input type="radio" name="q4" value="Y" autocomplete="off" required>是</input>
						  </label>
						  <label class="btn btn-outline-info">
							<input type="radio" name="q4" value="N" autocomplete="off" required>否</input>
						  </label>
						</div>
					</div>
					</div>
															
					<div class="form-group row">
						<label for="q5_1" class="col-12">5. 你是否已接種<span style="color:#323edd"><b>第二劑新型冠狀病毒病疫苗</b></span>並距今已超過14天? <span style="color:red">*</span></label>
						<div class="col-12">
					  <div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-info">
							<input type="radio" name="q5_1" value="Y" autocomplete="off" required>是</input>
						  </label>
						  <label class="btn btn-outline-info">
							<input type="radio" name="q5_1" value="N" autocomplete="off" required>否</input>
						  </label>
						</div>
					</div>
					</div>
										
					<div id="q6div" class="form-group row" style="display: none">
						<label for="q6" class="col-12">6. 你是否持有於過去14天內進行的2019冠狀病毒病檢測<b><u>有效陰性檢測結果</u></b>? <span style="color:red">*</span></label>
						<div class="col-12">
					  <div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-info">
							<input type="radio" name="q6" value="Y" autocomplete="off" required>是</input>
						  </label>
						  <label class="btn btn-outline-info">
							<input type="radio" name="q6" value="N" autocomplete="off" required>否</input>
						  </label>
						</div>
					</div>
					</div>
					
					<div class="form-group row" style="margin-left: 0px; margin-right: 0px; ">
						<div class="col-12" style="border-left: 6px solid #17a2b8; background-color: #e7f3fe; padding: 4px 12px;">請注意，你必須隨身攜帶有關證明以便公司隨時作出查核。</div>
					</div>
										
					<hr />
					
					<div class="form-group row">
						<div class="col-12" style="text-align:center">							
							  <input class="" type="checkbox" id="declare" value="option1" style="width: 20px;  height: 20px;" required >							
						</div>
						<label for="declare" class="col-12 col-form-label" style="text-align:center"><span style="color:red">*</span> 本人已閱知本健康申報表所列事項，並確保以上申報內容正確屬實。</label>
					</div>
					
					<div class="form-group row">
						<div class="col-12" style="text-align:left">							
							 <u><b>新冠肺炎 - 收集個人資料聲明</b></u>
						</div>
						<span class="col-12 col-form-label" style="font-size:10pt"> 此健康申報表上所收集的個人資料將用於檢察及預防新冠肺炎的傳播。有關資料如個人姓名、公司名稱、電話號碼及健康狀況將可能用於追蹤潛在帶菌者，並有可能會轉交或披露給衞生署及其他衛生部門以保障公共衛生。你必須提供有關資料以獲批准進入我們的地盤，而任何拒絕提供有關資料的人士將可能被拒絕進入我們的地盤。所有個人資料的收集、保留及使用將會嚴格遵守第486章《個人資料(私隱)條例》的一切要求。</span>
					</div>
					
					<div class="form-group row">
						<button class="btn btn-success" style="padding: 10px; width: 100vw;" id="submitBtn">
							提交
						</button>
					</div>
					
					 <a id='link' href="#"></a>
					
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
