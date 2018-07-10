app.controller('ticketSearchToDoController', function($scope, $rootScope, $http, $location) {

	$scope.init = function() {
		$scope.isLoading = true;
		$scope.pageSize = 5;
		$scope.currentPage = 1;
		$scope.loadPage();
		$scope.minDate = new Date();
		$scope.minDate.setDate($scope.minDate.getDate() - 1);
	}

	$scope.loadPage = function() {
		var search = '';
		if ($scope.searchText != '' && $scope.searchType != undefined) {
			if ($scope.searchType == 'date') {
				var aux = $scope.searchText.split('/');
				if (aux.length > 2) {
					$scope.searchText = aux[2] + '-' + aux[1] + '-' + aux[0];
				}
			}

			search = 'model[' + $scope.searchType + ']=' + $scope.searchText;
		}

		var pagination = '&pageSize=' + $scope.pageSize + '&currentPage=' + $scope.currentPage;
		var fullSearch = '&fullSearch=true';
		var sort = '&sortBy=date&sort=DESC';

		$scope.isLoading = true;
		$rootScope.helper.ajax('/ticket/search.json?' + search + pagination + fullSearch + sort
			, ''
			, function(result) {
				$scope.isLoading = false;
				$scope.elements = result.entries;
				$scope.totalItems = result.total;
				$rootScope.loadClients($scope);
				$rootScope.loadTicketOptions($scope);
			}
		);
	};

	$scope.loadElevators = function(element) {
		var idClientSearch = '&model[id_client]=' + element.id_client;

		element.$$temp_elevators = null;
		$rootScope.helper.ajax('/elevator/search.json?' + idClientSearch
			, ''
			, function(result) {
				element.$$temp_elevators = result.entries;
			}
		);
	};

	$scope.onClientChange = function(element) {
		$scope.loadElevators(element);
	};

	$scope.insert = function(element) {
		if ($scope.formModel['formNew'].$invalid) {
			return;
		}

		element.$$isUpdating = true;
		//element.selected.id_client = $scope.client.id;
		$rootScope.helper.ajax('/ticket/update.json'
			, { model : element.selected }
			, function(result) {
				element.$$isUpdating = false;
				element.selected.id = result.id;
				element.selected.$$isEditing = false;
				element.selected.$$isNew = false;

				var selectedElevator = element.selected.$$temp_elevators.find( function(value) { return value.id === element.selected.id_elevator } );
				element.selected.idElevator = selectedElevator;

				$scope.elements.push(element.selected);

				element.selected = { $$isNew:true };
			}
		);
	};

	$scope.update = function(element) {
		if ($scope.formModel['form' + element.id].$invalid) {
			return;
		}

		var index = $scope.elements.indexOf(element);

		element.$$isUpdating = true;
		$rootScope.helper.ajax('/ticket/update.json'
			, { model : element.selected }
			, function(result) {
				element.$$isUpdating = false;
				element.selected.$$isEditing = false;

				var selectedElevator = element.selected.$$temp_elevators.find( function(value) { return value.id === element.selected.id_elevator } );
				element.selected.idElevator = selectedElevator;

				$scope.elements[index] = element.selected;
			}
		);
	};

	$scope.remove = function(element) {

		if (element.$$isEditing) {
			element.$$isEditing = false;
			element.$$temp_elevators = null;
			return;
		}

		$rootScope.modal.remove(element.date, function() {
			element.$$isUpdating = true;
			$rootScope.helper.ajax('/ticket/remove.json'
				, { model : element }
				, function(result) {
					var index = $scope.elements.indexOf(element);
					$scope.elements.splice(index, 1);
					element.$$isUpdating = false;
				}
			);
		});
	};

	$scope.edit = function(element) {
		element.$$isEditing = true;
		element.selected = angular.copy(element);
		$scope.loadElevators(element.selected);
	};

	$scope.getTemplate = function(element) {
		return element.$$isEditing ? 'ticketToDo/edit' : 'ticketToDo/view';
	};


	$scope.onPageChange = function() {
		$scope.loadPage();
	};

});
