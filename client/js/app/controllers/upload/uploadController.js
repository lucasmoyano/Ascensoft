app.controller('uploadController', function($scope, $rootScope, $http, $location, $routeParams, Config) {

	$scope.initOnLoaded = function(category) {
		$scope.isLoading = true;
		$scope.category = category;
	  var eventCompleteLoadFiles = $rootScope.$on('completeLoadAccountingEntry', function(event, client) {
			$scope.client = client;
			$scope.loadClientFiles();
    });
    $scope.$on('$destroy', function() {
    	eventCompleteLoadFiles();
		});
    $scope.baseUrl = Config.baseUrl;
	}

	$scope.loadClientFiles = function() {
			$rootScope.helper.ajax('/ClientFile/search.json?ClientFile[id_client]=' + $routeParams.id
				, ''
				, function(result) {
					$scope.isLoading = false;
					$scope.clientFiles = result.entries;
				}
			);

		}

		$scope.onRemoveFile = function(clientFile) {
		$rootScope.modal.remove(clientFile.url, function() {

			clientFile.isRemoving = true;
			$rootScope.helper.ajax('/ClientFile/delete.json'
				, { id : clientFile.id }
				, function(result) {
					clientFile.isRemoving = false;
					$scope.loadClientFiles();
				});

			});
		}

		$scope.getUrlClient = function(url) {
			if (!url) {
				return '';
			}
			var flagFile = false;
			var aux = url.split('.');

			if (aux.length < 2) {
				flagFile = true;
			}

			var strExt = '';
			var strUrl = ''

			if (!flagFile) {
				strExt = aux[aux.length -1];
				for (var i = 0; i < aux.length -1; i++) {
					strUrl += aux[i];
				}
			}

			var urlFinal = 'img/icons/file.png';
			if (strExt == 'doc' || strExt == 'docx') {
				urlFinal = 'img/icons/doc.png';
			}
			if (strExt == 'xls' || strExt == 'xlsx') {
				urlFinal = 'img/icons/excel.png';
			}
			if (strExt == 'pdf') {
				urlFinal = 'img/icons/pdf.png';
			}
			if (strExt == 'jpg' || strExt == 'jpeg' || strExt == 'png' || strExt == 'gif') {
				urlFinal = $scope.baseUrl + '/server/' + strUrl + '_small.' + strExt;
			}
			return urlFinal;

		}

		$scope.onSaveFileDescription = function(clientFile) {

			var obj = {
						id : clientFile.id,
						description : clientFile.description
					};
			var data = { ClientFile : obj };
			clientFile.isRemoving = true;
			$rootScope.helper.ajax('/ClientFile/update.json'
				, data
				, function(result) {
					$scope.loadClientFiles();
					clientFile.isRemoving = false;
				}
			);
		}


		$scope.onUploadFiles = function() {
			 $scope.isUploadingFiles = true;
		    var formData = new FormData($('#formFPresForm' + $scope.category)[0]);

		    var url = '?ClientFile[category]=' + $scope.category;
		    url += '&ClientFile[id_client]=' + $scope.client.id;

		    $.ajax({

		        url: Config.baseUrl + '/server/clientFile/upload.json' + url,  //Server script to process data
		        type: 'POST',
		        xhr: function() {  // Custom XMLHttpRequest
		            var myXhr = $.ajaxSettings.xhr();
		            var progressHandlingFunction = function() {};
		            if(myXhr.upload){ // Check if upload property exists
		                myXhr.upload.addEventListener('progress',progressHandlingFunction, false); // For handling the progress of the upload
		            }
		            return myXhr;
		        },
		        //Ajax events
		        //beforeSend: beforeSendHandler,
		        success: function(result) {
					$scope.loadClientFiles();
			 		$scope.isUploadingFiles = false;
		        },
		        error: function(result) {
		        	console.log(error);
		        },
		        //error: errorHandler,
		        // Form data
		        data: formData,
		        //Options to tell jQuery not to process data or worry about content-type.
		        cache: false,
		        contentType: false,
		        processData: false
		    });
		}

});
