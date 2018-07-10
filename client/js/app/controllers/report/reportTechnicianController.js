app.controller('reportTechnicianController', function($scope, $rootScope, $http, $location) {

	$scope.init = function() {
		$scope.pageSize = 5;
		$scope.currentPage = 1;

		var year = new Date().getFullYear();

		$scope.initDate = year + '-01-01';
		$scope.endDate = (year + 1) + '-01-01';

		$scope.loadPage();
		$scope.canvas = $('#technician #canvas').clone();
	};

	$scope.loadPage = function() {

		$scope.isLoading = true;
		$rootScope.helper.ajax('/report/technician.json?init=' + $scope.initDate + '&end=' + $scope.endDate
			, ''
			, function(result) {
				$scope.isLoading = false;

				var labels = [];
				var totalResults = [];

				for (var i = 0; i < result.length; i++) {
					var value = result[i];
					labels.push(value.name);
					totalResults.push(value.total - 0);
				}

				var total = 0;
				var lengthClients = 11;

				if (result.length > lengthClients + 1) {
					for (var i = lengthClients; i < result.length; i++) {
						total += totalResults[i];
					}
					totalResults[lengthClients] = total;
					labels[lengthClients] = 'Otros';
					totalResults.length = labels.length = lengthClients + 1;
				}

        $scope.totalResults = totalResults;
        $scope.labels = labels;

				$scope.makeChart(totalResults, labels);
			}
		);
	};

  $scope.getColor = function(idx) {
    var color = '';
    switch(idx) {
      case 0: color = '#ff8c8c'; break;
      case 1: color = '#ffff8c'; break;
      case 2: color = '#97ff8c'; break;
      case 3: color = '#8cffef'; break;
      case 4: color = '#8c90ff'; break;
      case 5: color = '#ffd89b'; break;
      case 6: color = '#ba0000'; break;
      case 7: color = '#00ba12'; break;
      case 8: color = '#0300ba'; break;
      case 9: color = '#b000ba'; break;
      case 10: color = '#00bab7'; break;
      case 11: color = '#baba00'; break;
      default: color = '#7c85a5'; break;
    }
    return color;
  };

	$scope.getRandomColor = function() {
    var letters = '56789ABC'.split('');
    var color = '#';
    for (var i = 0; i < 6; i++ ) {
        color += letters[Math.floor(Math.random() * 8)];
    }
    return color;
	};

	$scope.makeChart = function(totalResults, labels) {

		var barChartData = [];

		for (var i = 0; i < labels.length; i++) {
			var obj = {
					value: totalResults[i],
          color:$scope.getColor(i),
          highlight: "#ddd",
					label: labels[i]
				};

			barChartData.push(obj);
		}

    $parent = $('#technician #canvas').parent();
    $('#technician #canvas').remove();
    $parent.append($scope.canvas.clone());

    var ctx = $('#technician #canvas').get(0).getContext("2d");
    var chart = new Chart(ctx).Doughnut(barChartData, {
      responsive : true
    });

	};

});
