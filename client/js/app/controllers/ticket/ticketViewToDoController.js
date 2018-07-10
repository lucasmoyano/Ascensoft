app.controller('ticketViewToDoController', function($scope, $rootScope, $http, $location, $routeParams) {

	$scope.init = function() {
		$scope.isLoading = true;
		$scope.loadPage();
	}

	$scope.loadPage = function() {
		var idClientSearch = '&model[id]=' + $routeParams.id;
		var fullSearch = '&fullSearch=true';

		$scope.isLoading = true;
		$rootScope.helper.ajax('/ticket/search.json?' + idClientSearch + fullSearch
			, ''
			, function(result) {
				$scope.isLoading = false;
				if (result.entries.length > 0) {
					$scope.element = result.entries[0];
				}
			}
		);
	};

});
