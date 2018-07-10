app.controller('administratorUpdateController', function($scope, $rootScope, $routeParams, $http, $location) {

	$scope.init = function() {
		$scope.load();
	}

	$scope.load = function() {
		if ($routeParams.id == 0) {
			$scope.onCompleteLoad();
			return;
		}

		var search = 'model[id]=' + $routeParams.id;

		$scope.isLoading = true;
		$rootScope.helper.ajax('/administrator/search.json?' + search
			, ''
			, function(result) {
				$scope.isLoading = false;
				$scope.element = result.entries[0];
				if ($scope.element.birthday = '0000-00-00 00:00:00') {
					$scope.element.birthday = null;
				}
				$scope.element.selected = angular.copy($scope.element);
				$scope.onCompleteLoad();
			}
		);
	};

	$scope.onCompleteLoad = function() {
		$rootScope.loadCountries($scope);
		if ($scope.element.id_country) {
			$rootScope.loadStates($scope.element.id_country, $scope);
		}
		if ($scope.element.id_state) {
			$rootScope.loadCities($scope.element.id_state, $scope);
		}
	}

	$scope.save = function(element) {
		if ($scope.formModel.$invalid) {
			return;
		}

		element.$$isUpdating = true;
		$rootScope.helper.ajax('/administrator/update.json'
			, { model : element.selected }
			, function(result) {
				element.$$isUpdating = false;
				element.selected.id = result.id;
				$scope.cancel();
			}
		);
	}

	$scope.cancel = function() {
		$location.path('/administrator/search');
	}

	$scope.openDatePicker = function() {
		$scope.isOpened = true;
	}

});
