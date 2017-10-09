(function(){
  var app = angular.module('youplusOlaAuto');

  app.controller('DriversController', ["$scope", "$http", function($scope, $http) {
  	$scope.drivers = [];
  	$scope.requests = {waiting: [], ongoing: [], complete: []};
  	$scope.fiveMin = (1000*60*5);
  	
  	$scope.onlyDrivers = function(){
  	  $http.get('/drivers.json', {})
        .then(function(response) {
          $scope.drivers = response.data;
        });
  	}
  	
  	$scope.dStatus = function(bool){
  	  return bool==true? "Available" : "Busy";
  	}
  	
  	$scope.refresh = function(){
  	  $http.get('/requests.json', {})
        .then(function(response) {
          $scope.requests = $scope.format(response.data);
        });
  	}
  	
  	
  	$scope.format = function(data){
  	  var requests = {waiting: [], ongoing: [], complete: []};
  	  data.forEach(function(d){
  	    if(d.status==1){
  	      requests.waiting.push(d);
  	    }else if(d.status == 2){
  	      requests.ongoing.push(d);
  	    }else if(d.status == 3){
  	      requests.complete.push(d);
  	    }
  	  });
  	  return requests;
  	}
  	
  	$scope.letsRide = function(request){
  	  $http.post('/requests/'+request.id+'/rides.json',{})
  	    .then(function(response){
  	      $scope.expireIt(response.data)
  	      $scope.refresh();
  	    }, function(response){
  	      alert("Driver is busy..")
  	    })
  	}
  	
  	$scope.expireIt = function(request){
  	  setTimeout(function(){
        $scope.doneRide(request);
      }, $scope.fiveMin)
      
  	}
  	
  	$scope.doneRide = function(request){
  	  
  	  $http.post('/requests/'+request.id+'/complete.json', {})
        .then(function(response){
          $scope.refresh();
        })
  	}
  }]);
})();