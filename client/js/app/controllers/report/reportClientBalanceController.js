app.controller('reportClientBalanceController', function($scope, $rootScope, $http, $location) {

	$scope.init = function() {
		$scope.pageSize = 5;
		$scope.currentPage = 1;

		var year = new Date().getFullYear();

		$scope.initDate = year + '-01-01';
		$scope.endDate = (year + 1) + '-01-01';

		$scope.loadPage();
		$scope.canvas = $('#clientBalance #canvas').clone();
	};

	$scope.loadPage = function() {

		$scope.isLoading = true;
		$rootScope.helper.ajax('/report/clientBalance.json?init=' + $scope.initDate + '&end=' + $scope.endDate
			, ''
			, function(result) {
				$scope.isLoading = false;

				var labels = [];
				var debitResults = [];

				for (var i = 0; i < result.length; i++) {
					var value = result[i];
					labels.push(value.name);
					debitResults.push(value.debit - 0);
				}

				var total = 0;
				var lengthClients = 11;

				if (result.length > lengthClients + 1) {
					for (var i = lengthClients; i < result.length; i++) {
						total += debitResults[i];
					}
					debitResults[lengthClients] = total;
					labels[lengthClients] = 'Otros';
					debitResults.length = labels.length = lengthClients + 1;
				}

				$scope.makeChart(debitResults, labels);
			}
		);
	};

	$scope.makeChart = function(debitData, labels) {
		var barChartData = {
		  labels : labels,
		  datasets : [
		    {
		      fillColor : "rgba(0,187,0,0.5)",
		      strokeColor : "rgba(0,187,0,0.8)",
		      highlightFill : "rgba(0,187,0,0.75)",
		      highlightStroke : "rgba(0,187,0,1)",
		      data : debitData
		    }
		  ]

		}

    $parent = $('#clientBalance #canvas').parent();
    $('#clientBalance #canvas').remove();
    $parent.append($scope.canvas.clone());

    var ctx = $('#clientBalance #canvas').get(0).getContext("2d");
    var chart = new Chart(ctx).Bar(barChartData, {
      responsive : true
    });

	};

});
