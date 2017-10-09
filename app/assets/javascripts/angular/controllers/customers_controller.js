(function(){
  var app = angular.module('youplusOlaAuto');

  app.controller('CustomersController', ["$scope", "$http", function($scope, $http) {
  	$scope.request = {}
  	
  	$scope.letsRide = function(){
  		if( $scope.request.customer_id == undefined) return;
  		$http.post('/requests.json', {request: $scope.request})
          .then(function(response){
            
          })
  		$scope.request = {};
  	}
  }]);
})();