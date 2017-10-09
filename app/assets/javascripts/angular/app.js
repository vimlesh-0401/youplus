(function(){
  var app = angular.module('youplusOlaAuto', ['ngResource']);
  app.run(function($rootScope){
    $rootScope.author = { name: "Vimlesh Patel", email: "vimlesh.0401@gmail.com" }
    $rootScope.timely = function(datestring, status){
			return cfg.timely(datestring, status);
		}
  })
})();

var cfg = {};
cfg.one = 1000*60*60*24;

cfg.timely = function(datestring, withpred){
	console.log(withpred)
	var d1 = new Date(datestring);
	var d2 = new Date();
	var t1 = d1.getTime();
	var t2 = d2.getTime();
	var td = t2 - t1;
	var dm = td/1000;
	var ss = Math.floor(dm % 60);
	dm = dm/60;
	var mm = Math.floor(dm % 60);
	dm = dm/60;
	var hh = Math.floor(dm % 24);
	var dd = Math.floor(dm/24);
	return cfg.conf(dd, hh, mm, ss, withpred);
}

cfg.conf = function(dd, hh, mm, ss, withpred){
	var date = [];
	if(dd > 0){ date.push(dd, ' days'); }

	if(hh > 0){ if(date.length>0){ date.push(', ')}; date.push(hh, ' Hrs'); }

	if(mm > 0){ if(date.length>0){ date.push(', ')}; date.push(mm, ' Min');}

	if(ss > 0){ if(date.length>0){ date.push(', ')}; date.push(ss, ' Sec'); }
	if(withpred !== false){if(date.length>0){date.push(' ago')}else{ date.push('just now')}}
	return date.join('');
}