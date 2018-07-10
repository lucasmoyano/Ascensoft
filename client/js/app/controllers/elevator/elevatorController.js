app.controller('elevatorController', function($scope, $rootScope, $http, $location, $routeParams) {

	$scope.init = function() {
		$scope.pageSize = 5;
		$scope.currentPage = 1;
		$scope.loadPage();
	}

	$scope.initOnLoaded = function() {
		$scope.isLoading = true;
	  var eventCompleteLoadElevator = $rootScope.$on('completeLoadClient', function(event, client) {
			$scope.client = client;
			$scope.init();
    });
    $scope.$on('$destroy', function() {
    	eventCompleteLoadElevator();
		});
	}

	$scope.loadPage = function() {
		var search = '';
		if ($scope.searchText != '' && $scope.searchType != undefined) {
			search = 'model[' + $scope.searchType + ']=' + $scope.searchText;
		}

		var pagination = '&pageSize=' + $scope.pageSize + '&currentPage=' + $scope.currentPage;
		var idClientSearch = '&model[id_client]==' + $scope.client.id;

		$scope.isLoading = true;
		$rootScope.helper.ajax('/elevator/search.json?' + search + pagination + idClientSearch
			, ''
			, function(result) {
				$scope.isLoading = false;
				$scope.elevators = result.entries;
				$scope.totalItems = result.total;
				$scope.loadAllElevators();
			}
		);
	};

	$scope.loadAllElevators = function() {
		var idClientSearch = '&model[id_client]==' + $scope.client.id;
		$rootScope.helper.ajax('/elevator/search.json?' + idClientSearch
			, ''
			, function(result) {
				$rootScope.temp_elevators = result.entries;
				$rootScope.$broadcast('completeLoadElevator', $scope.client);
			}
		);
	};

	$scope.insert = function(element) {
		if ($scope.formModel['formNew'].$invalid) {
			return;
		}

		element.$$isUpdating = true;
		element.selected.id_client = $scope.client.id;

		$rootScope.helper.ajax('/elevator/update.json'
			, { model : element.selected }
			, function(result) {
				element.$$isUpdating = false;

				element.selected.id = result.id;
				element.selected.$$isEditing = false;
				element.selected.$$isNew = false;
				$scope.elevators.push(element.selected);

				element.selected = { $$isNew:true };
				$scope.loadAllElevators();
			}
		);
	}

	$scope.update = function(element) {
		if ($scope.formModel['form' + element.id].$invalid) {
			return;
		}

		var index = $scope.elevators.indexOf(element);

		element.$$isUpdating = true;
		$rootScope.helper.ajax('/elevator/update.json'
			, { model : element.selected }
			, function(result) {
				element.$$isUpdating = false;
				element.selected.$$isEditing = false;
				$scope.elevators[index] = element.selected;
				$scope.loadAllElevators();
			}
		);
	}

	$scope.remove = function(element) {

		if (element.$$isEditing) {
			element.$$isEditing = false;
			return;
		}

		$rootScope.modal.remove(element.name, function() {
			element.$$isUpdating = true;
			$rootScope.helper.ajax('/elevator/remove.json'
				, { model : element }
				, function(result) {
					var index = $scope.elevators.indexOf(element);
					$scope.elevators.splice(index, 1);
					element.$$isUpdating = false;
					$scope.loadAllElevators();
				}
			);
		});
	}

	$scope.edit = function(element) {
		element.$$isEditing = true;
		element.selected = angular.copy(element);
	}

	$scope.getTemplate = function(element) {
		return element.$$isEditing ? 'edit' : 'view';
	}


	$scope.onPageChange = function() {
		$scope.loadPage();
	};

});
