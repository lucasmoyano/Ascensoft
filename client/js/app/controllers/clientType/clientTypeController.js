app.controller('clientTypeController', function($scope, $rootScope, $http, $location) {

	$scope.init = function() {
		$scope.pageSize = 5;
		$scope.currentPage = 1;
		$scope.loadPage();
	}

	$scope.loadPage = function() {
		var search = '';
		if ($scope.searchText != '' && $scope.searchType != undefined) {
			search = 'model[' + $scope.searchType + ']=' + $scope.searchText;
		}

		var pagination = '&pageSize=' + $scope.pageSize + '&currentPage=' + $scope.currentPage;

		$scope.isLoading = true;
		$rootScope.helper.ajax('/clientType/search.json?' + search + pagination
			, ''
			, function(result) {
				$scope.isLoading = false;
				$rootScope.clientTypes = result.entries;
				$scope.totalItems = result.total;
			}
		);
	};

	$scope.insert = function(element) {
		if ($scope.formModel['formNew'].$invalid) {
			return;
		}

		element.$$isUpdating = true;

		$rootScope.helper.ajax('/clientType/update.json'
			, { model : element.selected }
			, function(result) {
				element.$$isUpdating = false;

				element.selected.id = result.id;
				element.selected.$$isEditing = false;
				element.selected.$$isNew = false;
				$rootScope.clientTypes.push(element.selected);

				element.selected = { $$isNew:true };
			}
		);
	}

	$scope.update = function(element) {
		if ($scope.formModel['form' + element.id].$invalid) {
			return;
		}

		var index = $rootScope.clientTypes.indexOf(element);

		element.$$isUpdating = true;
		$rootScope.helper.ajax('/clientType/update.json'
			, { model : element.selected }
			, function(result) {
				element.$$isUpdating = false;
				element.selected.$$isEditing = false;
				$rootScope.clientTypes[index] = element.selected;
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
			$rootScope.helper.ajax('/clientType/remove.json'
				, { model : element }
				, function(result) {
					var index = $rootScope.clientTypes.indexOf(element);
					$rootScope.clientTypes.splice(index, 1);
					element.$$isUpdating = false;
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
