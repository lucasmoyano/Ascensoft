app.controller('reportClientDueController', function($scope, $rootScope, $http, $location) {

	$scope.init = function() {
		$scope.pageSize = 5;
		$scope.currentPage = 1;

		var year = new Date().getFullYear();

		$scope.initDate = year + '-01-01';
		$scope.endDate = (year + 1) + '-01-01';

		$scope.loadPage();
		$scope.canvas = $('#clientDue #canvas').clone();
	};

	$scope.loadPage = function() {

		$scope.isLoading = true;
		$rootScope.helper.ajax('/report/clientDue.json?init=' + $scope.initDate + '&end=' + $scope.endDate
			, ''
			, function(result) {
				$scope.isLoading = false;

				var labels = [];
				var creditResults = [];

				for (var i = 0; i < result.length; i++) {
					var value = result[i];
					labels.push(value.name);
					creditResults.push(value.credit - 0);
				}

				var total = 0;
				var lengthClients = 11;

				if (result.length > lengthClients + 1) {
					for (var i = lengthClients; i < result.length; i++) {
						total += creditResults[i];
					}
					creditResults[lengthClients] = total;
					labels[lengthClients] = 'Otros';
					creditResults.length = labels.length = lengthClients + 1;
				}

				$scope.makeChart(creditResults, labels);
			}
		);
	};

	$scope.makeChart = function(creditData, labels) {
		var barChartData = {
		  labels : labels,
		  datasets : [
		    {
		      fillColor : "rgba(187,0,0,0.5)",
		      strokeColor : "rgba(187,0,0,0.8)",
		      highlightFill : "rgba(187,0,0,0.75)",
		      highlightStroke : "rgba(187,0,0,1)",
		      data : creditData
		    }
		  ]

		}

    $parent = $('#clientDue #canvas').parent();
    $('#clientDue #canvas').remove();
    $parent.append($scope.canvas.clone());

    var ctx = $('#clientDue #canvas').get(0).getContext("2d");
    var chart = new Chart(ctx).Bar(barChartData, {
      responsive : true
    });

	};

});
