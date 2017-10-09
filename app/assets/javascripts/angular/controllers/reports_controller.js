(function(){
  var app = angular.module('youplusOlaAuto');

  app.controller('ReportsController', ["$scope", "$http", function($scope, $http) {
  	$scope.requests = {};
  	
  	$scope.refresh = function(){
  	  $http.get('/requests.json', {})
        .then(function(response) {
          console.log(response)
          $scope.requests = response.data;
        });
  	};
  	
  	$scope.rStatus = function(num){
  	  return ['', 'Waiting', 'Ongoing', 'Complete'][num];
  	};
  }]);
})();