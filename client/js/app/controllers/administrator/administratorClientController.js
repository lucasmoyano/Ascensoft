app.controller('administratorClientController', function($scope, $rootScope, $http, $location) {

	$scope.init = function() {
		$scope.pageSize = 5;
		$scope.currentPage = 1;
		$scope.loadPage();
		$scope.loadClientElements();
	}

	$scope.initOnLoaded = function() {
		$scope.isLoading = true;
	  var eventCompleteLoadAdministrator = $rootScope.$on('completeLoadEngineer', function(event, client) {
			$scope.client = client;
			$scope.init();
    });
    $scope.$on('$destroy', function() {
    	eventCompleteLoadAdministrator();
		});
	}

	$scope.loadPage = function() {
		var search = '';
		if ($scope.searchText != '' && $scope.searchType != undefined) {
			search = 'model[' + $scope.searchType + ']=' + $scope.searchText;
		}

		var pagination = '&pageSize=' + $scope.pageSize + '&currentPage=' + $scope.currentPage;

		$scope.isLoading = true;
		$rootScope.helper.ajax('/administrator/search.json?' + search + pagination
			, ''
			, function(result) {
				$scope.isLoading = false;
				$scope.elements = result.entries;
				$scope.totalItems = result.total;
				$rootScope.$broadcast('completeLoadAdministrator', $scope.client);
			}
		);
	};

	$scope.loadClientElements = function() {
		var idClientSearch = '&model[id_client]==' + $scope.client.id;

		$rootScope.helper.ajax('/clientAdministrator/search.json?' + idClientSearch
			, ''
			, function(result) {
				$scope.clientElements = result.entries;
				$rootScope.temp_administrators = result.entries;
			}
		);
	};

	$scope.insert = function(element) {
		if ($scope.formModel['formNew'].$invalid) {
			return;
		}

		element.$$isUpdating = true;
		$rootScope.helper.ajax('/administrator/update.json'
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

	$scope.addToClient = function(element) {
		for (var key  in $scope.clientElements) {
			var aux = $scope.clientElements[key];
			if (element.id == aux.id_administrator) {
				return;
			}
		}

		var clientElement = {
			id_client : $scope.client.id,
			id_administrator : element.id,
			idAdministrator : {
				first_name : element.first_name,
				last_name : element.last_name
			}
		}

		element.$$isUpdating = true;
		$rootScope.helper.ajax('/clientAdministrator/update.json'
			, { model : clientElement }
			, function(result) {
				element.$$isUpdating = false;
				clientElement.id = result.id;
				$scope.clientElements.push(clientElement);
			}
		);

	}

	$scope.update = function(element) {
		if ($scope.formModel['form' + element.id].$invalid) {
			return;
		}

		var index = $scope.elements.indexOf(element);

		element.$$isUpdating = true;
		$rootScope.helper.ajax('/administrator/update.json'
			, { model : element.selected }
			, function(result) {
				element.$$isUpdating = false;
				element.selected.$$isEditing = false;
				$scope.elements[index] = element.selected;
			}
		);
	}

	$scope.removeClient = function(clientElement) {
		clientElement.$$isUpdating = true;
		$rootScope.helper.ajax('/clientAdministrator/delete.json'
			, { id : clientElement.id }
			, function(result) {
				var index = $scope.clientElements.indexOf(clientElement);
				$scope.clientElements.splice(index, 1);
				clientElement.$$isUpdating = false;
			}
		);
	}

	$scope.edit = function(element) {
		element.$$isEditing = true;
		element.selected = angular.copy(element);
	}

	$scope.getTemplate = function(element) {
		return element.$$isEditing ? 'administrator/edit' : 'administrator/view';
	}


	$scope.onPageChange = function() {
		$scope.loadPage();
	};

});
