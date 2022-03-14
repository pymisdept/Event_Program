<%@ Page Language="C#" CodeBehind="Default.aspx.cs" Inherits="LuckyDrawReg.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="./Scripts/jquery-3.4.1.min.js"></script>
    <script src="./Scripts/bootstrap.min.js"></script>
    <script src="./Scripts/jquery.localize.js"></script>
    <title data-localize="title">保華疫苗接種百萬大抽獎 Paul Y. Vaccination COVID-19 Lucky Draw</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=11"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="./images/icons/favicon.ico"/>
    <%--<link href="Content/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="./Content/bootstrap.min.css" rel="stylesheet"/>
    <link href="./Content/Site.css" rel="stylesheet"/>
    <link href="./Content/pretty.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/@mdi/font@5.4.55/css/materialdesignicons.min.css" rel="stylesheet">
    <script src="./Scripts/sweetalert.min.js"></script>
    <style>
	html,body{
        height:100%;
        width:100%;
        margin:0px;padding:0px;
        background-color: #efeaec;
    }
    .banner-button {
        display: flex;
        justify-content: center;
        flex-direction: row;
        margin: 0 auto;
        margin-top: 26px;
        margin-bottom: 6px;
    }
    .mdi-check:before {
        content: "  ";
    }


	</style>
    <script>
	function getQueryString(name) { 
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
            var r = window.location.search.substr(1).match(reg); 
            if (r != null) return unescape(r[2]); 
            return null; 
        }
        var lang = getQueryString("lang");
	function change_language(){
    	var language = document.getElementById("language").innerText
    	if (language == "Eng"){
    		change_english();
    	}
    	else if(language == "中文"){
    		change_chinese();
    	}
    }
    function change_english(){
		var btn = document.getElementById("btn_id");
		btn.src="Images/luckydraw(Covid19)05_en_btn.png";
		var language_button = document.getElementById("language");
		$("[data-localize]").localize("home", { language: "en" });
		language_button.innerText = "中文";
    }
    function change_chinese(){
    	var btn = document.getElementById("btn_id");
    	btn.src="Images/luckydraw(Covid19)05_ch_btn.png";
    	var language_button = document.getElementById("language");
    	$("[data-localize]").localize("home", { language: "zh" });
        language_button.innerText = "Eng";
    }
    function jump_to_next(){
	    var box1 = document.getElementById("checkbox1").checked;
	    var box2 = document.getElementById("checkbox2").checked;
	    if(box1===true&&box2===true){
	        return true;
	    }
	    else{
	        return false;
	    }
    }
	</script>
</head>
<body>
<div class="container-fluid" style="height: 100%;width:100%;margin: 0px;padding: 0px;">
<div class="bg-contact3" style="background: linear-gradient(to right,#ecebefba, #ecebefba), url('./images/luckydraw(Covid19)05bg_ch1.jpg');background-size: cover;">
    <div style="text-align: right">
        <button id="language" class="btn btn-outline-secondary" type="button" style="margin-top: 10px; margin-right: 10px;" onclick="change_language()">Eng</button>
    </div>
    <div class="draw_logo_div" style="text-align: center;">
        <img class="draw_logo" src="Images/luckydraw(Covid19)05logo_ch1.png" style="height:100%;margin: 0 auto;" alt=""/>
    </div>
    <br>
    <div class="row justify-content-center">
        <div class="col-xl-3 col-md-4 col-lg-4 col-sm-6 col-10" style="text-align:left">
                        <div class="pretty info curvy a-tada">
                            <input id="checkbox1" type="checkbox">
                            <label><i class="mdi mdi-check"></i><span style="color:red"> *</span><span class="checkbox_label" style="line-height: 1.4;font-weight: bold;letter-spacing:2px;text-shadow: 4px 1px 1px #f8f9fa;" data-localize="declare1"> 本人為合資格之保華建業員工。</span>
                            </label>
                        </div>
        </div>
                    </div>
        <br>
        <div class="row justify-content-center">
        <div class="col-xl-3 col-md-4 col-lg-4 col-sm-6 col-10" style="text-align:left">
            <div class="pretty info curvy a-tada">
                <input type="checkbox" id="checkbox2">
                <label>
                    <i class="mdi mdi-check"></i><span style="color:red"> *</span><span class="checkbox_label" style="line-height: 1.4;font-weight: bold;letter-spacing:2px;text-shadow: 4px 1px 1px #f8f9fa;" data-localize="declare2"> 於登記抽獎當天已完成接種兩劑新冠疫苗。</span>
                </label>
            </div>
        </div>
    </div>
    <div class="banner-button">
        <a class="registerGATrigger" onclick="return jump_to_next()" href="./Draw">
            <img id="btn_id" src="Images/luckydraw(Covid19)05_ch_btn.png" alt="" style="height :72px;cursor:pointer;"/>

        </a>
    </div>
    <br>
    <br>
    <div class="row" style="padding-left: 20px; padding-right: 20px; padding-top: 20px;">
    <div class="col-xl-10 col-lg-10 col-md-10 col-sm-11 col-12" style="">
        <p style="color: #000;" data-localize="Remarks">註：</p>
        <p style="color: #000;" data-localize="Remarks1">-	香港聘僱的員工(代客聘用的員工除外)，如於2021年9月30日或以前完成接種兩劑由香港特區政府2019冠狀病毒病接種計劃下的新冠疫苗，可參加抽獎。</p>
        <p style="color: #000;" data-localize="Remarks2">-	截止登記日期定於2021年10月6日。</p>
        <p style="color: #000;" data-localize="Remarks3">-	公司保留是次抽獎的最終解釋及決定權。</p>
                </div>
        </div>
    </div>
    
</div>
</body>