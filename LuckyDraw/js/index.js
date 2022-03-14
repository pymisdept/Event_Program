/*
 Main js
*/

var remainPerson = [];
var fullList = [];

var pos = 0;

var winner = [];
var winnerCount = 0;

var stopTimer;
var timer;

var lastMove = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
var initTime = 50;
var clicks = 0;

var maxPrize = 10;
var moveTime = [70, 80, 90, 100, 110, 120, 130, 140, 150, 160];

var prizeNum = [4, 10, 1, 1, 10, 8, 1, 10, 10, 10, 4, 2, 4, 1, 1];
var oPrizeNum = [2, 125, 125, 125, 120, 125, 125, 125, 125, 125, 125];

var prizeName = ["15", "14", "13", "12", "11", "10", "9", "8", "7", "6", "5", "4", "3", "2", "1"];
var prizeNameMap = ['Info Think iAnion-100 隨身負離子空氣清新機', 'Panasonic 曬被寶 FD-F06S1H', 'Klipsch T5 無線耳機', 'B&O Beoplay E8 2.0 無線耳機', '德國寶 SOUS VIDE PRO低溫慢煮套裝', 'Apple AirPods Pro 耳機','iPad 7th Generation WiFi 32GB','Dji Osmo Pocket 口袋雲台相機','Dyson 風筒 Supersonic HD03','Panasonic MC-RS765 吸塵機械人','Apple Watch Series 5 40mm手錶','Dyson 三合一風扇暖風清新機','Panasonic 納米離子加濕空氣清新機','Panasonic 靜音吸塵機械人','Panasonic 靜音吸塵機械人'];

var oPrizeNameMap = ["電子邊爐鍋", "Panasonic「護髮負離子」捲髮器", "Panasonic充電鬚刨", "Panasonic「護髮負離子」速乾可摺式風筒", "GEMINI 摺疊式旅行電水壺", "關小姐老陳皮冰糖燉檸檬", "位元堂白花菇", "位元堂加拿大花旗參片", "位元堂即食鮑汁螺片 2盒", "位元堂精選螺片", " 位元堂即食燉湯 2盒", "百佳禮券 50元"];
var oPrizeName = ["16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27"]; 
var ranList = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];

var internalCallback;
var internalCallback2;
var mmmPos = 0;

$(function () {
	$('#loading').hide();
	
	$("#result").fadeOut("normal",function(){
                $("#result").html("<div><span>請先更新列表</span></div>");
                $("#result").fadeIn();
                });
				
    $("#btnStart").text("準備開始");
	
    $("#btnStart").on("click", function () 
	{
        if ($("#btnStart").text().substring(0,2) === "開始") 
		{
			clearResult();
			if(clicks < 15)
			{
				$("#btnStart").text("進行中...");
				$('#loading').show();
				
				
				var cnt = 15 - clicks;
				if(cnt > 0)
				{
					for(i = 0 ; i < prizeNum[clicks]; i++)
					{
						doRandom(i);
					}
					
					checkRandom();
				}
				
				window.setTimeout(showResult, 2500);
			}
			else
			{
				showStaffName();
				randOtherPrize();
			}
        }
        else if ($("#btnStart").text().substring(0,2) === "停止") {
            $("#btnStart").text("準備開始");
			
			doRemove();
			clicks += 1;
		}
		else if ($("#btnStart").text().substring(0,4) === "準備開始") 
		{
			if (fullList.length <= 0) {
					showDialog("請先更新列表");
					return false;
			}
			  	
			$("#btnStart").text("開始");
			displayPrizeNum();
			displayPrizePic();
			clearResult();
		}
		else if ($("#btnStart").text().substring(0,3) === "大抽獎") 
		{
			if (fullList.length <= 0) {
					showDialog("請先更新列表");
					return false;
			}
			  	
			$("#btnStart").text("開始");
			displayPrizeNum();
			displayPrizePic();
			clearResult();
			
			$('#footer_zone').css('margin-top', '0');
			document.body.style.backgroundImage = 'url(css/img/lucky_draw_bg02_4.jpg)';
			$('#mainContent').show();
		}
    });
	
	$("#btnFile").on("change", function (e) {
		 handleFile(e);
		 $("#btnFile").val("");
	});
});
 
 function showStaffName()
 {
	$('#loading').show();
	$('#finalist').show();
	
	setDeceleratingTimeout(doLoop);
 }
 
 
 function doLoop()
 {
	 splitV = remainPerson[mmmPos].split("|");	
	 $('#finalist').text(splitV[0]);
	 mmmPos += 1;	 
 }
 
 function randOtherPrize()
 {
	var otherPos = 0;
	var otherCounter = oPrizeNum[otherPos] - 1;
	var totalCount = fullList.length ;
	
	for(i = 0 ; i < totalCount; i++)
	{
		var rVal = GetRandomNumO(0, fullList.length - 1);
		var obj = fullList[rVal];
		
		if(obj === undefined)
			console.log("is nan: " + rVal);
		
		winner.push(obj + "|" + oPrizeName[otherPos] + "|" + oPrizeNameMap[otherPos]);	
		
		fullList.splice(rVal, 1);
		if(i == otherCounter)
		{
			otherPos += 1;
			otherCounter = otherCounter + oPrizeNum[otherPos];
			//console.log(fullList.length + "   -   "  + otherCounter); 
		}
	}
 }
 
 function doRemove()
 {
	 var f_idx = -1;
	 var r_idx = -1;
	 var obj;
	 for(i = 0; i < prizeNum[clicks]; i++)	 
	 {
		if(ranList[i] != -1 && remainPerson.length > 0)
		{			
			obj = remainPerson[ranList[i]];	
			winner.push(obj + "|" + prizeName[clicks] + "|" + prizeNameMap[clicks]);									
			ranList[i] = -1;	
		}
	 }
	 
	 for(j = winnerCount; j < winnerCount + prizeNum[clicks]; j++)	 
	 {		 
		 if(j < winner.length)
		 {
			obj = winner[j];	
			objWOPrize = obj.substring(0,obj.lastIndexOf("|"));
			objWOPrize = objWOPrize.substring(0,objWOPrize.lastIndexOf("|"));
			
			f_idx = fullList.indexOf(objWOPrize);
			r_idx = remainPerson.indexOf(objWOPrize);
			
			if(f_idx == -1 || r_idx == -1)
				console.log("Could not find this" + objWOPrize);
			
			if (f_idx !== -1) {
				fullList.splice(f_idx, 1);
			}
				
			if (r_idx !== -1) {
				remainPerson.splice(r_idx, 1);			
			}	
			
			console.log("Full: " + fullList.length + " , " + remainPerson.length);
		 }
	}	
	
	winnerCount += prizeNum[clicks];
	 
 }
 
 function doRandom(pos)
 {
	 if(remainPerson.length > 0)
	 {
		var rVal = GetRandomNumO(0, remainPerson.length - 1);
		//console.log(rVal);
		ranList[pos] = rVal;
	 }
 }
 
 function checkRandom()
 {
	var ranCnt = prizeNum[clicks] - 1;
	for(i = ranCnt; i >= 0 ; i--)
	{
		for(j = ranCnt; j >= 0 ; j--)
		{
			if(j == i)
				continue;
			
			//console.log("Checking: " + ranList[i] + " = " + ranList[j] + " ? " );
			if(ranList[j] == ranList[i])
			{
				console.log('Duplicate');
				doRandom(i);
				j = ranCnt;
			}
		}
	}
	 
 }

 function displayPrizePic()
 {
	var cnt = 15 - clicks;
	var objName = "#prizePic";
	var path = "css/img/p";
	
	if(cnt == 0)
	{
		$(objName).attr('src', "css/img/p_all.png");	 	 
		$("#prizePicDiv").css("text-align", "center");
		$("#prizePicDiv").removeClass("col-6");
		$("#prizePicDiv").addClass("col-12");
	}
	else
		$(objName).attr('src', path + (cnt) + ".png");	 	 
 }
 
 function displayPrizeNum ()
 {		 
	var cnt = prizeNum[clicks];
	 for(var i = 1 ; i <= maxPrize ; i++)
	 {
		 var objName = "#col_t" + (i).toString().padStart(2,'0');	
		 
		 if(i <= cnt) {
			 
			 $(objName).show();
			 if(cnt <= 5)
			 {
				 $('#winnerBox').css('margin-top','0px');
				 
				 $('#t01').css('height', '90px');
				 $('#t02').css('height', '90px');
				 $('#t03').css('height', '90px');
				 $('#t04').css('height', '90px');
				 $('#t05').css('height', '90px');
				// $(objName).removeClass("col-6");
				// $(objName).addClass("col-12");
			 }
			 else if(cnt == 8)
			 {
				 $('#winnerBox').css('margin-top','-85px');
				 
				 $('#t01').css('height', '55px');
				 $('#t02').css('height', '55px');
				 $('#t03').css('height', '55px');
				 $('#t04').css('height', '55px');
				 $('#t05').css('height', '55px');
				 $('#t06').css('height', '55px');
				 $('#t07').css('height', '55px');
				 $('#t08').css('height', '55px');
				 $('#t09').css('height', '55px');
				 $('#t10').css('height', '55px');
			 }
			 else
			 {
				 $('#winnerBox').css('margin-top','-200px');
				 $('#t01').css('height', '55px');
				 $('#t02').css('height', '55px');
				 $('#t03').css('height', '55px');
				 $('#t04').css('height', '55px');
				 $('#t05').css('height', '55px');
				 $('#t06').css('height', '55px');
				 $('#t07').css('height', '55px');
				 $('#t08').css('height', '55px');
				 $('#t09').css('height', '55px');
				 $('#t10').css('height', '55px');
				// $(objName).removeClass("col-12");
				// $(objName).addClass("col-6");
			 }
		 }
		 else {
			 $(objName).hide();
		 }	 
	 }
 }
 
 function handleFile(e) {
   
    var files = e.target.files;
    var f;     
		
	f = files[0];
    var reader = new FileReader();
    var name = f.name;
    var extension = name.split('.').pop().toLowerCase();
		
	if(extension == "xlsx")
	{
		reader.onload = function (e) {
           var data = e.target.result;
           var workbook = XLSX.read(data, { type: 'binary' });                
           var sheet_name_list = workbook.SheetNames; 
		   var result;
		   var ttl = 0;
		   		   
           sheet_name_list.forEach(function (y) { /* iterate through sheets */
                  //Convert the cell value to Json
		   
           var roa = XLSX.utils.sheet_to_json(workbook.Sheets[y]);
           if (roa.length > 0) {
               result = roa;
			   addToList(result);
			   
			   if(y == 17)
				   remainPerson = allPerson;
			   else
			   {
				   fullList = allPerson;	
				   ttl += result.length;
			   }				   
           }
		   });
		   
		   if(ttl == 0)
				showDialog("檔案不正確，請再試一次");
		   else
		   {
			   showDialog("上傳成功 (" + ttl + ")");				   			   						   
		   }
		   
		   $("#btnStart").text("大抽獎");
         };
		 reader.readAsArrayBuffer(f);
	}else
	{
		showDialog("檔案不正確，請再試一次");
	}
 }
	
function showResult()
{
	$('#loading').hide();
	
	var cnt = 15 - clicks;
	if(cnt > 0)
	{
		displayName();
	}
	else
	{
		$('#mainContent').hide();
		$('#btnStart').hide();
		
		animateCss('#resultBox', "fadeIn", "", 250);
		$('#resultBox').show();
	}
}

function clearResult()
{
	$("#t01").val("");
	$("#t02").val("");
	$("#t03").val("");
	$("#t04").val("");
	$("#t05").val("");
	$("#t06").val("");
	$("#t07").val("");
	$("#t08").val("");
	$("#t09").val("");
	$("#t10").val("");	
	
	ranList = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
}

function displayEachName(pos)
{	
	var objName = "#t" + (pos + 1).toString().padStart(2,'0');	
	var $obj = $(objName); 
	
	var i = ranList[pos];		
	splitV = remainPerson[i].split("|");	
	animateCss(objName, "fadeIn", splitV[1] + " - " + splitV[0], 250);
	$obj.val(splitV[1] + " - " + splitV[0]);	
}

function displayName() 
{
	var start = 0;
	
    internalCallback = function(sVal) {
        return function() {			
			
			if (sVal < prizeNum[clicks]) {
				window.setTimeout(internalCallback, 500);
				displayEachName(sVal);
				sVal++;				
			}
			else{				
				$("#btnStart").text("停止");
				$("#btnStart").click() ; 		
			}
        }
    }(start);
	
    internalCallback();
};

function writeToFile() {
	if(winner.length > 0)
		console.save(winner,'result.txt');
}

function animateCss(element,animationName,v,t) {
    const node = $(element);
			
    node.addClass('animated ' + animationName + ' t' + t);	
	
    node.on('animationend', function() {
	  node.removeClass('animated ' + animationName + ' t' + t);
	});
}


jQuery.fn.single_double_click = function(single_click_callback, double_click_callback, timeout) {
  return this.each(function(){
    var clicks = 0, self = this;
    jQuery(this).click(function(event){
      clicks++;
      if (clicks == 1) {
        setTimeout(function(){
          if(clicks == 1) {
            single_click_callback.call(self, event);
          } else {
            double_click_callback.call(self, event);
          }
          clicks = 0;
        }, timeout || 250);
      }
    });
  });
}
