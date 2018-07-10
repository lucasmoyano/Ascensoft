app.controller('clientSearchController', function($scope, $rootScope, $http, $location) {

	$scope.init = function() {
		$scope.pageSize = 10;
		$scope.currentPage = 1;
		$scope.loadPage();
	}

	$scope.loadAdministrators = function() {
		$rootScope.helper.ajax('/administrator/getAll.json'
			, ''
			, function(result) {
				$scope.administrators = result;
			}
		);
	};

	$scope.loadEngineers = function() {
		$rootScope.helper.ajax('/engineer/getAll.json'
			, ''
			, function(result) {
				$scope.engineers = result;
			}
		);
	};

	$scope.loadPage = function() {
		var search = '';
		if ($scope.searchText != '' && $scope.searchText != undefined) {
			search = 'search=' + $scope.searchText;
		}

		var pagination = '&pageSize=' + $scope.pageSize + '&currentPage=' + $scope.currentPage;

		$scope.isLoading = true;
		$rootScope.helper.ajax('/client/mainSearch.json?' + search + pagination
			, ''
			, function(result) {
				$scope.isLoading = false;
				$scope.elements = result.entries;
				$scope.totalItems = result.total;
				$scope.onCompleteLoad();
			}
		);
	};

	$scope.onCompleteLoad = function() {
		$scope.loadAdministrators();
		$scope.loadEngineers();
		$rootScope.loadClientTypes($scope);
	}

	$scope.insert = function(element) {
		if ($scope.formModel['formNew'].$invalid) {
			return;
		}

		element.$$isUpdating = true;
		$rootScope.helper.ajax('/client/update.json'
			, { model : element.selected }
			, function(result) {
				element.$$isUpdating = false;
				element.selected.id = result.id;
				element.selected.$$isEditing = false;
				element.selected.$$isNew = false;
				$scope.elements.push(element.selected);

				element.selected = { $$isNew:true };
			}
		);
	}

	$scope.update = function(element) {
		if ($scope.formModel['form' + element.id].$invalid) {
			return;
		}

		var index = $scope.elements.indexOf(element);

		element.$$isUpdating = true;
		$rootScope.helper.ajax('/client/update.json'
			, { model : element.selected }
			, function(result) {
				element.$$isUpdating = false;
				element.selected.$$isEditing = false;
				$scope.elements[index] = element.selected;
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
			$rootScope.helper.ajax('/client/remove.json'
				, { model : element }
				, function(result) {
					var index = $scope.elements.indexOf(element);
					$scope.elements.splice(index, 1);
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
