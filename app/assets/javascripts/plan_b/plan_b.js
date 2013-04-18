angular.module('plan-b', ['plan-b.itineraries.controllers', 'plan-b.itineraries.services']);
angular.module('plan-b').config(function ($routeProvider, $locationProvider) {
  var mountPath = $('html').attr('mount-path');

  $routeProvider.when(mountPath + '/itineraries/new', {
    templateUrl: '/assets' + mountPath + '/itineraries/new.html'
  , controller: 'NewItineraryCtrl'
  , resolve: {
      itinerary: function(Itinerary) {
        return new Itinerary();
      }
    }
  });

  $routeProvider.when(mountPath + '/itineraries/:id/edit', {
    templateUrl: '/assets' + mountPath + '/itineraries/edit.html'
  , controller: 'EditItineraryCtrl'
  , resolve: {
      itinerary: function($q, $route, Itinerary) {
        var deferred  = $q.defer()
        ,   onSuccess = function(result) { deferred.resolve(result); }
        ,   onError   = function(result) { deferred.reject(result);  };
        Itinerary.get({id: $route.current.params.id }, onSuccess, onError);
        return deferred.promise;
      }
    }
  });

  $locationProvider.html5Mode(true);
})
.config(["$httpProvider", function(provider) {
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
}])
.run(function($rootScope, $location) {
  $rootScope.mountPath = $('html').attr('mount-path');

  $rootScope.$on("$routeChangeStart", function (event, next, current) {
    $rootScope.alertMessage = "Loading...";
    $rootScope.alertType = "secondary";
    $rootScope.alertShow = true;
  });
  $rootScope.$on("$routeChangeError", function (event, next, current) {
    $rootScope.alertMessage = "There was a problem :(";
    $rootScope.alertType = "alert";
    $rootScope.alertShow = true;
  });
  $rootScope.$on("$routeChangeSuccess", function (event, next, current) {
    $rootScope.alertMessage = "";
    $rootScope.alertType = "";
    $rootScope.alertShow = false;
  });

});
