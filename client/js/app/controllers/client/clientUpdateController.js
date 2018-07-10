app.controller('clientUpdateController', function($scope, $rootScope, $routeParams, $http, $location) {

	$scope.init = function() {
    $scope.load();

    $scope.$on('$destroy', function() {
      $rootScope.helper.cancelAllRequests();
    });
	}

	$scope.load = function() {
		if ($routeParams.id == 0) {
			$scope.onCompleteLoad();
			return;
		}

		var search = 'model[id]=' + $routeParams.id;

		$scope.isLoading = true;
		$rootScope.helper.ajax('/client/search.json?' + search
			, ''
			, function(result) {
				$scope.isLoading = false;
				$scope.element = result.entries[0];
				$scope.element.selected = angular.copy($scope.element);
				$scope.onCompleteLoad();
			}
		);
	};

	$scope.onCompleteLoad = function() {
		$rootScope.$broadcast('completeLoadClient', $scope.element);
		$rootScope.loadClientTypes($scope);
		$rootScope.loadCountries($scope);
		if ($scope.element.id_country) {
			$rootScope.loadStates($scope.element.id_country, $scope);
		}
		if ($scope.element.id_state) {
			$rootScope.loadCities($scope.element.id_state, $scope);
		}
		$scope.setPointMap($scope.element.latitude, $scope.element.longitude);
	};

	$scope.save = function(element) {
		if ($scope.formModel.$invalid) {
			return;
		}

		element.selected.latitude = ("" + $scope.marker.coords.latitude).substr(0, 16);
		element.selected.longitude = ("" + $scope.marker.coords.longitude).substr(0, 16);

		element.$$isUpdating = true;
		$rootScope.helper.ajax('/client/update.json'
			, { model : element.selected }
			, function(result) {
				element.$$isUpdating = false;
				element.selected.id = result.id;
				$scope.cancel();
			}
		);
	};

  $scope.searchAddress = function(element) {
    var address = element.selected.address;

    address = address.replace(/ /g, "+");

    var country = $scope.countries.find( function(value) { return value.id === element.selected.id_country } );
    var state = $scope.states.find( function(value) { return value.id === element.selected.id_state } );
    var city = $scope.cities.find( function(value) { return value.id === element.selected.id_city } );

    var cityName = city.name.replace(/ /g, "+");
    var stateName = state.name.replace(/ /g, "+");
    var countryName = country.name.replace(/ /g, "+");

    var fullSearch = address + '+' + cityName + '+' + stateName + '+' + countryName;
    var urlMap = 'http://maps.googleapis.com/maps/api/geocode/json?address=' + fullSearch + '&sensor=false';

    $scope.isLoadingMap = true;

    $http({
        url: urlMap,
        dataType: 'json',
        method: 'POST',
        data: '',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        }
    }).success(function(data) {
        $scope.isLoadingMap = false;
        if (data.status == 'OK') {
          var latitude = data.results[0].geometry.location.lat;
          var longitude = data.results[0].geometry.location.lng;
          $scope.element.latitude = latitude;
          $scope.element.longitude = longitude;
          $scope.setPointMap($scope.element.latitude, $scope.element.longitude);
        }
    });

    /*$.ajax({
      type: "GET",
      url: urlMap,
      data: '',
      cache: false,
      success: function(data) {
    alert($scope.isLoadingMap)
      console.log("loading complete");
      $scope.isLoadingMap = false;
        if (data.status == 'OK') {
          var latitude = data.results[0].geometry.location.lat;
          var longitude = data.results[0].geometry.location.lng;
          $scope.element.latitude = latitude;
          $scope.element.longitude = longitude;
          $scope.setPointMap($scope.element.latitude, $scope.element.longitude);
        }
      },
      error: function(request,error) {
        console.log(error);
      },
      dataType: "json"
    });*/


  };

	$scope.cancel = function() {
		$location.path('/client/search');
	};

	$scope.openDatePicker = function() {
		$scope.isOpened = true;
	};

	$scope.setPointMap = function(latitude, longitude) {
    var zoom = 18;
		if (latitude == null || latitude == undefined) {
			latitude = -31.4;
      zoom = 12;
		}

		if (longitude == null || longitude == undefined) {
			longitude = -64.18;
		}


		$scope.map = {
      center: { latitude: latitude - 0 + 0.0005, longitude: longitude - 0 - 0.0008 },
      zoom: zoom,
      events: {
        tilesloaded: function (map) {
                $scope.$apply(function () {
                  window.setTimeout(function(){
                    google.maps.event.trigger(map, "resize");
                  }, 100);
                });
            }
        }
    };

		$scope.marker = {
      id: 0,
      coords: {
        latitude: latitude,
        longitude: longitude
      },
      options: { draggable: true },
      events: {
        dragend: function (marker, eventName, args) {
          var lat = marker.getPosition().lat();
          var lon = marker.getPosition().lng();

          $scope.marker.options = {
            draggable: true,
            labelContent: "lat: " + $scope.marker.coords.latitude + ' ' + 'lon: ' + $scope.marker.coords.longitude,
            labelAnchor: "100 0",
            labelClass: "marker-labels"
          };
        }
      }
    };

	};



});

