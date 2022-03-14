/**
 * Created by c-zouzhongxing on 2017/1/4.
 */
var aCount = [];

function showDialog(promptStr) {
    var tempStr = "<div class='Dialog'><div><div>" + promptStr + "<div><button class='btnCloseDialog'>OK</button></div></div></div></div>";
    $("body").append(tempStr).find(".Dialog").find("button").on("click", function () {
        DestroyDialog();
    });
}

function DestroyDialog() {
    $(".Dialog").remove();
}

function showConfirm(promptStr, callback) {
    var tempStr = "<div class='Confirm'><div><div>" + promptStr + "<div><button class='btnConfirm'>Yes</button><button class='btnReturn'>No</button></div></div></div></div>";
    $("body").append(tempStr).find(".Confirm").find("button:nth-child(1)").on("click", function () {
        DestroyConfirm();
        if (typeof(callback) == "function") {
            callback();
        }
    }).next().on("click", function () {
        DestroyConfirm();
    });
}
function DestroyConfirm() {
    $(".Confirm").remove();
}


function getRandomArrayElements(arr, count) {
    var shuffled = arr.slice(0),
        i = arr.length,
        min = i - count,
        temp, index;
    while (i-- > min) {
        index = Math.floor((i + 1) * Math.random());
        temp = shuffled[index];
        shuffled[index] = shuffled[i];
        shuffled[i] = temp;
    
        $("#showName").val(shuffled[i]);
        $("#showName").delay(800).fadeIn();
    }
    return shuffled.slice(min);
}

Array.prototype.unique = function () {
    var n = {},
        r = []; 
    for (var i = 0; i < this.length; i++) 
    {
        if (!n[this[i]]) 
        {
            n[this[i]] = true; 
            r.push(this[i]); 
        }
    }
    return r;
}


Array.prototype.delete = function (arr) {
    //var r = this.repeatedly();
    var b = [];
    for (var i = 0; i < this.length; i++) {
        //console.log(arr);
        if (arr.indexOf(this[i]) < 0) {
            b.push(this[i]);
        }
    }
    return b;
}


Array.prototype.repeatedly = function () {
    var n = {},
        r = []; 
    for (var i = 0; i < this.length; i++) 
    {
        if (!n[this[i]]) 
        {
            n[this[i]] = true; 
        } else {
            r.push(this[i]);
        }
    }
    return r;
}


Array.prototype.deleteRepeatedly = function () {
    var r = this.repeatedly();
    var b = [];
    for (var i = 0; i < this.length; i++) {
        if (r.indexOf(this[i]) < 0) {
            b.push(this[i]);
        }
    }
    return b;
}

Array.prototype.deleteBlankObj = function () {
    var b = [];
    for (var i = 0; i < this.length; i++) {
        if (this[i].length != 0) {
            b.push(this[i]);
        }
    }
    return b;
};

function GetRandomNum(Min, Max) {
    var Range = Max - Min;
    var Rand = Math.random();
	
	var outV = (Min + Math.round(Rand * Range));
	aCount[outV] += 1;
	
	var m = aCount[outV];
	if (m % 2 == 0)
	{
		Rand = Math.random();
		outV = (Min + Math.round(Rand * Range));
		aCount[outV] += 1;
	}
	
    return (outV);
}

function GetRandomNumO(Min, Max){
    var Range = Max - Min;
    var Rand = Math.random();
    var w = (Min + Math.round(Rand * Range));
	
	return w;
}

function GenRandomNum(count) {
	aCount = new Array(count);
	aCount.fill(0);
}
