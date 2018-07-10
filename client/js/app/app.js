var app = angular.module('app', ['ngRoute', 'ui.bootstrap', 'uiGmapgoogle-maps']);

app.factory('Config', function($location) {
    var config = {
        systemName: 'System',
        version: '0.43',
        dateFormat: 'dd/MM/yyyy',
        //baseUrl: 'http://localhost:8080/ascensoft',
        //baseUrl: 'http://southsystemsar.com/ascensoft3',
        mockMode: false,
        debugMode: false,
    };

    config.baseUrl = $location.absUrl().split('#')[0];
    if (config.baseUrl.slice(-1) == '/') {
        config.baseUrl = config.baseUrl.substring(0, config.baseUrl.length - 1);
    }

    config.getSystemName = function() {
        return config.systemName + ' v' + config.version;
    }

    return config;
});



app.filter('cut', function () {
        return function (value, wordwise, max, tail) {
            if (!value) return '';

            max = parseInt(max, 10);
            if (!max) return value;
            if (value.length <= max) return value;

            value = value.substr(0, max);
            if (wordwise) {
                var lastspace = value.lastIndexOf(' ');
                if (lastspace != -1) {
                    value = value.substr(0, lastspace);
                }
            }

            return value + (tail || ' …');
        };
    });

app.filter('reverse', function() {
  return function(items) {
    return items.slice().reverse();
  };
});







app.factory('controlSessions', function(){
    return {
        //obtenemos una sesión //getter
        get : function(key) {
            return sessionStorage.getItem(key)
        },
        //creamos una sesión //setter
        set : function(key, val) {
            return sessionStorage.setItem(key, val)
        },
        //limpiamos una sesión
        unset : function(key) {
            return sessionStorage.removeItem(key)
        }
    }
});

app.factory('authUsers', function($http, $location, $rootScope, controlSessions){
    var cacheSession = function(user) {
        controlSessions.set("logged", true);
        controlSessions.set("id", user.id);
        controlSessions.set("id_role", user.id_role);
        controlSessions.set("email", user.email);
        controlSessions.set("first_name", user.first_name);
        controlSessions.set("last_name", user.last_name);
    }
    var unCacheSession = function() {
        controlSessions.unset("logged");
        controlSessions.unset("id");
        controlSessions.unset("id_role");
        controlSessions.unset("email");
        controlSessions.unset("first_name");
        controlSessions.unset("last_name");
    }

    return {
        login : function(user, callback) {

            $rootScope.helper.ajax('/session/login.json'
              , { model : user }
              , function(result) {

                if (result.status == 'ok') {
                    $rootScope.flagNotifications = true;
                    cacheSession(result.user);
                    $location.path('/ticket/search');
                }
                callback(result.status);
              }
            );
        },
        logout : function() {
            unCacheSession();
            $location.path("/");
        },
        isLoggedIn : function() {
            return controlSessions.get("logged");
        },
        getUser : function()  {
            return {
                logged      : controlSessions.get("logged"),
                id          : controlSessions.get("id"),
                id_role     : controlSessions.get("id_role"),
                email       : controlSessions.get("email"),
                first_name  : controlSessions.get("first_name"),
                last_name   : controlSessions.get("last_name"),
            };
        }
    }
});












app.config(function($routeProvider) {
    $routeProvider
        .when('/', {
            templateUrl: 'js/app/views/user/search.html'
        })
        .when('/role/search', {
            templateUrl: 'js/app/views/role/search.html'
        })
        .when('/clientType/search', {
            templateUrl: 'js/app/views/clientType/search.html'
        })
        .when('/user/search', {
            templateUrl: 'js/app/views/user/search.html'
        })
        .when('/user/update', {
            templateUrl: 'js/app/views/user/update.html'
        })
        .when('/user/profile', {
            templateUrl: 'js/app/views/user/profile.html'
        })
        .when('/engineer/search', {
            templateUrl: 'js/app/views/engineer/search.html'
        })
        .when('/engineer/update', {
            templateUrl: 'js/app/views/engineer/update.html'
        })
        .when('/technician/search', {
            templateUrl: 'js/app/views/technician/search.html'
        })
        .when('/technician/update', {
            templateUrl: 'js/app/views/technician/update.html'
        })
        .when('/administrator/search', {
            templateUrl: 'js/app/views/administrator/search.html'
        })
        .when('/administrator/update', {
            templateUrl: 'js/app/views/administrator/update.html'
        })
        .when('/client/search', {
            templateUrl: 'js/app/views/client/search.html'
        })
        .when('/client/update', {
            templateUrl: 'js/app/views/client/update.html'
        })
        .when('/ticket/search', {
            templateUrl: 'js/app/views/ticket/search.html'
        })
        .when('/ticket/view', {
            templateUrl: 'js/app/views/ticket/viewToDo.html'
        })
        .when('/accounting-entry/search', {
            templateUrl: 'js/app/views/accountingEntry/search.html'
        })
        .when('/accounting-entry/search-due', {
            templateUrl: 'js/app/views/accountingEntry/searchDue.html'
        })
        .when('/accounting-entry/view-due', {
            templateUrl: 'js/app/views/accountingEntry/viewDue.html'
        })
        .when('/accounting-entry/account-type', {
            templateUrl: 'js/app/views/accountType/search.html'
        })
        .when('/notification/search', {
            templateUrl: 'js/app/views/notification/search.html'
        })
        .when('/report/report', {
            templateUrl: 'js/app/views/report/report.html'
        })
        .otherwise({
            redirectTo: '/'
        });
});

app.run(['$route', angular.noop]);

app.run(function($rootScope, $location, $http, Config, authUsers) {

    var serverRoute = Config.baseUrl + (Config.mockMode ? 'client/js/app/mocks' : '/server');
    var stackCancellers = [];

    $rootScope.helper = {
        ajax: function(url, data, onComplete) {
            var lastUrl = url;
            var canceller = $.Deferred();
            stackCancellers.push(canceller);

            console.log('REQUEST - ' + lastUrl);
            data = data ? data : '';

            $http({
                url: serverRoute + url,
                dataType: 'json',
                method: 'POST',
                data: $.param(data),
                timeout: canceller.promise,
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            }).success(function(result, status, headers, config) {
                console.log('RESULT');
                console.log(result);
                onComplete(result);
            }).error(function(result, status, headers, config) {
                if (Config.debugMode) {
                    document.write(result);
                } else {
                    alert('Ocurrió un problema inesperado.');
                }
            });
        },
        cancelAllRequests: function() {
            for (var i; i < stackCancellers.length; i++) {
                var canceller = stackCancellers[i];
                canceller.resolve();
            }
            stackCancellers.length = 0;
        },
        convertDate: function(str) {
            if (str == undefined) {
                return;
            }
            var aux = str.split(' ');
            aux = aux[0].split('-');
            return aux[2] + '/' + aux[1] + '/' + aux[0];
        },
        convertToMoney: function(value) {
            if (value == null) {
                value = 0;
            }
            var aux = '$' + value;
            aux = aux.replace("$-", "-$");
            return aux;
        }
    };

    $rootScope.logout = function() {
        authUsers.logout();
    }

    $rootScope.$on("$routeChangeSuccess", function(event, next, current) {

        if (authUsers.isLoggedIn()) { //($rootScope.loggedUser) {
            $rootScope.view = 'js/app/views/main-content.html';
        } else {
            $location.path('/login');
            $rootScope.view = 'js/app/views/login.html';
        }

        switch (next.templateUrl) {
            default:
                $rootScope.mainContent = next.templateUrl;
                break;
        }
    });



    $rootScope.loadRoles = function($scope) {
        if ($rootScope.roles) {
            $scope.roles = $rootScope.roles;
            return;
        }

        $rootScope.helper.ajax('/role/search.json'
            , ''
            , function(result) {
                $rootScope.roles = result.entries;
            }
        );
    };



    $rootScope.loadTechnicians = function($scope) {
        /*if ($rootScope.technicians) {
            $scope.technicians = $rootScope.technicians;
            return;
        }*/

        $rootScope.helper.ajax('/technician/search.json'
            , ''
            , function(result) {
                $rootScope.technicians = result.entries;
            }
        );
    };



    $rootScope.loadUsers = function($scope) {
        if ($rootScope.users) {
            $scope.users = $rootScope.users;
            return;
        }

        $rootScope.helper.ajax('/user/search.json'
            , ''
            , function(result) {
                $rootScope.users = result.entries;
            }
        );
    };


    $rootScope.loadAccountTypes = function($scope) {
        if ($rootScope.accountTypes) {
            $scope.accountTypes = $rootScope.accountTypes;
            return;
        }

        $rootScope.helper.ajax('/accountType/search.json'
            , ''
            , function(result) {
                $rootScope.accountTypes = result.entries;
            }
        );
    };



    $rootScope.loadTicketOptions = function($scope) {
        if ($rootScope.ticketOptions) {
            $scope.ticketOptions = $rootScope.ticketOptions;
            return;
        }

        $rootScope.helper.ajax('/ticketOption/search.json'
            , ''
            , function(result) {
                $rootScope.ticketOptions = result.entries;
            }
        );
    };



    $rootScope.loadClientTypes = function($scope) {
        if ($rootScope.clientTypes) {
            $scope.clientTypes = $rootScope.clientTypes;
            return;
        }

        $rootScope.helper.ajax('/clientType/search.json'
            , ''
            , function(result) {
                $rootScope.clientTypes = result.entries;
            }
        );
    };

    $rootScope.loadClients = function($scope) {
        /*if ($rootScope.clients) {
            $scope.clients = $rootScope.clients;
            return;
        }*/

        $rootScope.helper.ajax('/client/search.json'
            , ''
            , function(result) {
                $rootScope.clients = result.entries;
                $scope.clients = $rootScope.clients;
            }
        );
    };

    $rootScope.loadCountries = function($scope) {
        if ($rootScope.countries) {
            $scope.countries = $rootScope.countries;
            return;
        }

        $rootScope.helper.ajax('/country/search.json'
            , ''
            , function(result) {
                $rootScope.countries = result.entries;
            }
        );
    };

    $rootScope.loadStates = function(idCountry, $currentScope) {
        var search = 'model[id_country]=' + idCountry;

        $rootScope.helper.ajax('/state/search.json?' + search
            , ''
            , function(result) {
                $currentScope.states = result.entries;
            }
        );
    }

    $rootScope.loadCities = function(idState, $currentScope) {
        var search = 'model[id_state]=' + idState;

        $rootScope.helper.ajax('/city/search.json?' + search
            , ''
            , function(result) {
                $currentScope.cities = result.entries;
            }
        );
    }


});

app.directive("csDateToIso", function ($filter) {

    var linkFunction = function (scope, element, attrs, ngModelCtrl) {

        ngModelCtrl.$parsers.push(function (datepickerValue) {

            return $filter('date')(datepickerValue, 'yyyy-MM-dd');
        });
    };

    return {
        restrict: "A",
        require: "ngModel",
        link: linkFunction
    };
});


/*
app.run(function($rootScope, $location, authUsers){
    //creamos un array con las rutas que queremos controlar
    var rutasPrivadas = ["/","/info","/login"];
    //al cambiar de rutas
    $rootScope.$on('$routeChangeStart', function(){
        //si en el array rutasPrivadas existe $location.path(), locationPath en el login
        //es /login, en la home / etc, o el usuario no ha iniciado sesión, lo volvemos
        //a dejar en el formulario de login
        if(!authUsers.isLoggedIn()){
            $location.path("/login");
        }
        //en el caso de que intente acceder al login y ya haya iniciado sesión lo mandamos a la home
        if(($location.path() === '/login') && authUsers.isLoggedIn()){
            $location.path("/");
        }
    })
});
*/