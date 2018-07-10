app.controller('ticketClientController', function($scope, $rootScope, $http, $location) {

	$scope.init = function() {
		$scope.pageSize = 5;
		$scope.currentPage = 1;
		$scope.loadPage();
		$scope.maxDate = new Date();
		$scope.maxDate.setDate($scope.maxDate.getDate() + 1);
	}

	$scope.initOnLoaded = function() {
		$scope.isLoading = true;
	  var eventCompleteLoadTicket = $rootScope.$on('completeLoadAdministrator', function(event, client) {
			$scope.client = client;
			$scope.init();
    });
    $scope.$on('$destroy', function() {
    	eventCompleteLoadTicket();
		});
	}

	$scope.loadPage = function() {
		var search = '';
		if ($scope.searchText != '' && $scope.searchType != undefined) {
			search = 'model[' + $scope.searchType + ']=' + $scope.searchText;
		}

		var ticketsComplete = '&model[id_ticket_option]=>0'

		var pagination = '&pageSize=' + $scope.pageSize + '&currentPage=' + $scope.currentPage;
		var idClientSearch = '&model[id_client]==' + $scope.client.id;
		var draft = '&draft=true'
		var sort = '&sortBy=date&sort=DESC';

		$scope.isLoading = true;
		$rootScope.helper.ajax('/ticket/search.json?' + search + pagination + idClientSearch + ticketsComplete + draft + sort
			, ''
			, function(result) {
				$scope.isLoading = false;
				$scope.elements = result.entries;
				$scope.totalItems = result.total;
				$rootScope.loadTicketOptions($scope);
				$rootScope.loadTechnicians($scope);
			}
		);
	};

	$scope.insert = function(element) {
		if ($scope.formModel['formNew'].$invalid) {
			return;
		}

		element.$$isUpdating = true;
		element.selected.id_client = $scope.client.id;
		$rootScope.helper.ajax('/ticket/update.json'
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
		$rootScope.helper.ajax('/ticket/update.json'
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
	}

	$scope.edit = function(element) {
		element.$$isEditing = true;
		element.selected = angular.copy(element);
	}

	$scope.getTemplate = function(element) {
		return element.$$isEditing ? 'ticket/edit' : 'ticket/view';
	}


	$scope.onPageChange = function() {
		$scope.loadPage();
	};

});
