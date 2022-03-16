var allPerson =  [];

var setEmptyPerson = new Boolean();
setEmptyPerson = false;

var setAutoZoom = new Boolean();
setAutoZoom = true ;


function addToList(value)
{
	allPerson = [];
	value.forEach((personInfo) => {
			
		if(personInfo.Name != undefined)
		{
			var sid = "";
			var dept = "";
			var engName = "";
			var engDept = "";
			
			if(personInfo.Dept != undefined)
				dept = personInfo.Dept;
			else 
				dept = "";
			
			if(personInfo.StaffID != undefined)
				sid = personInfo.StaffID;
			else 
				sid = "";
			
			if(personInfo.EngName != undefined)
				engName = personInfo.EngName;
			else 
				engName = "";
			
			if(personInfo.EngDept != undefined)
				engDept = personInfo.EngDept;
			else 
				engDept = "";
			
			allPerson.push(personInfo.Name + "|" + dept + "|" + sid + "|" + engName + "|" + engDept);
		}
	});
}
	