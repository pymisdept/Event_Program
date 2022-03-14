<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LuckyDrawReg.Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	       <script src="../Scripts/jquery-3.4.1.min.js"></script>
    	   <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery.localize.js"></script>
	<title data-localize="title">保華疫苗接種百萬大抽獎</title>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" href="../images/icons/favicon.ico"/>
    <%--<link href="Content/bootstrap.min.css" rel="stylesheet" />--%>
	<link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/Site.css" rel="stylesheet" />
	<script src="../Scripts/sweetalert.min.js"></script>
</head>
<body>
<script>
function change_language(){
	var language = document.getElementById("language").innerText
	if (language == "Eng"){
		change_english();
	}
	else if(language == "中文"){
		change_chinese();
		
	}
}
	function getQueryString(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) return unescape(r[2]); 
			return null; 
	}

	var lang = getQueryString("lang");

	function change_english() {
		$("[data-localize]").localize("text", { language: "en" });
		window.location.href = '?lang=eng';
	}

    function change_chinese(){
		$("[data-localize]").localize("text", { language: "zh" });
        window.location.href ='/LuckyDrawReg/Draw';
    }
   

</script>
	<div class="bg-contact3" style="background-image: url('../images/luckydraw(Covid19)05bg_ch1.jpg');">
		<div class="container-contact3">
			<div class="wrap-contact4">
				<form class="contact3-form validate-form" method="post" id="myForm" name="myForm" runat="server" >
					<img src="./images/banner.jpg" width="100%" />
					<div style="text-align: right">   <button id="language" class="btn btn-outline-secondary" type="button" style="margin-top: 10px;" onclick="change_language()" data-localize="lang">Eng</button></div>
						<!--<span style="color:black">
						<h2 data-localize="title">保華疫苗接種百萬大抽獎</h2>
						<br />
							<span data-localize="span">
						公司將送出總值100萬元的大抽奬。幸運兒將獲不少於港幣5,000元
							</span>
						</span>
						<br />-->
					<hr />
					

				  
				   <div class="form-group row">
					<label for="post" class="col-sm-4 col-form-label"><span data-localize="ID">員工編號 ﹕</span><span style="color:red">*</span></label>
					<div class="col-sm-8">
						<asp:TextBox type="text" runat="server" class="form-control" id="post" name="post" placeholder="" maxlength="5" required/>
					</div>
				  </div>
					
					<div class="form-group row">
					<label for="post" class="col-sm-4 col-form-label"><span data-localize="name">員工名稱 ﹕</span><span style="color:red">*</span></label>
					<div class="col-sm-8">
						<asp:TextBox type="text" runat="server" class="form-control" id="name" name="name" placeholder="" maxlength="100" required/>
					</div>
				  </div>
					
				   <div class="form-group row">
					<label for="post" class="col-sm-4 col-form-label"><span data-localize="HKID">身份證號碼(字母及首3個數字) ﹕</span><span style="color:red">*</span></label>
					<div class="col-sm-8">
						<asp:TextBox type="text" runat="server" class="form-control" id="hkid" name="hkid" placeholder="" maxlength="4" required/>
					</div>
				  </div>
										
					<hr />
					
					
				
					<div class="form-group row">
						<asp:Button class="contact4-form-btn" runat="server" style="padding: 10px; width: 100vw;" Text="提交 Submit" id="submitBtn" OnClick="btn_Click" />
					</div>
					
					 <a id='link' href="#'"></a>
					
				</form>
			</div>
		</div>
	</div>
</body>
    	<script>
			function success() {
				if (lang == 'eng') {
					swal('Register SUCCESSFULLY', '', 'success');
				}
				else {
					swal('登記成功!', '', 'success');
				}
			}
			function hr() {
				if (lang == 'eng') {
					swal('Fail to Register. Please contact with H.R. Department !', '', 'warning');
				}
				else {
					swal('未能成功登記，請與人力資源部聯絡 !', '', 'warning');
				}
			}
			function wrong() {
				if (lang == 'eng') {
                    swal({ title: 'Invalid Staff No. or Hong Kong ID Card No.!', text: 'Please try again or contact HR Department.', icon: 'error' });
				}
				else {
                    swal({ title: '員工編號 或 香港身份證號碼錯誤 !', text: '請更正再試 或 與人力資源部聯絡。', icon: 'error' });
				}
			}
			if (status == 'hr') {
				hr();
			}
			if (status == 'wrong') {
				wrong();
			}
			if (status == 'success') {
				success();
			}
        
			if (lang == 'eng') {
				$("[data-localize]").localize("text", { language: "en" });
			}
			else {
				$("[data-localize]").localize("text", { language: "zh" });
			}
        </script>
</html>
