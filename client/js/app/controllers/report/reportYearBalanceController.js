app.controller('reportYearBalanceController', function($scope, $rootScope, $http, $location) {

	$scope.init = function() {
		$scope.pageSize = 5;
		$scope.currentPage = 1;

		$scope.chartYear = new Date().getFullYear();
		$scope.loadPage();
		$scope.canvas = $('#canvas').clone();
	};

	$scope.makeChart = function(debitData, creditData) {
		var barChartData = {
		  labels : ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"],
		  datasets : [
		    {
		      fillColor : "rgba(220,0,0,0.5)",
		      strokeColor : "rgba(220,0,0,0.8)",
		      highlightFill: "0(220,0,0,0.75)",
		      highlightStroke: "rgba(220,0,0,1)",
		      data : debitData
		    },
		    {
		      fillColor : "rgba(0,187,0,0.5)",
		      strokeColor : "rgba(0,187,0,0.8)",
		      highlightFill : "rgba(0,187,0,0.75)",
		      highlightStroke : "rgba(0,187,0,1)",
		      data : creditData
		    }
		  ]

		}

    $('#canvas').parent().append($scope.canvas.clone());
    $('#canvas').remove().parent().append($scope.canvas);

    var ctx = $('#canvas').get(0).getContext("2d");
    var chart = new Chart(ctx).Bar(barChartData, {
      responsive : true
    });

	};

	$scope.loadPage = function() {

		$scope.isLoading = true;
		$rootScope.helper.ajax('/report/YearBalance.json?year=' + $scope.chartYear
			, ''
			, function(result) {
				$scope.isLoading = false;
				//$rootScope.reports = result.entries;

				var debitResults = [0,0,0,0,0,0,0,0,0,0,0,0];
				var creditResults = [0,0,0,0,0,0,0,0,0,0,0,0];

				for (idx in result) {
					var value = result[idx];
					debitResults[value.month] = value.debit;
					creditResults[value.month] = value.credit;
				}

				$scope.makeChart(debitResults, creditResults);
			}
		);
	};
});
