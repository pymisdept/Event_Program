
function setDeceleratingTimeout(callback) {
	var start = 5;
	var limit = 21;
	var max = 800;
	var min = 30;
	var startV = 150;
	
    internalCallback = function(tick) {
        return function() {			
			
			console.log('hi1');
			if (--tick >= 0) {
								
				window.setTimeout(internalCallback, 50);
				callback();
			}
			else
			{
				$('#loading').hide();
				showResult();
			}
        }
    }(50);

    window.setTimeout(internalCallback, 500);
};
