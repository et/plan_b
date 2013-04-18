angular.module('plan-b.itineraries.controllers', ['plan-b.itineraries.services'])
.controller('ItinerariesCtrl', function($scope, Itinerary) {

  $scope.loadItineraries = function() {
    Itinerary.query(function(itineraries) {
      $scope.itineraries = itineraries;
    }, function(err) {
      console.log("Failed to retrieve itineraries");
    });
  };

  $scope.$on('itineraryUpdate', function() {
    $scope.loadItineraries();
  });

  $scope.loadItineraries();
})
.controller('NewItineraryCtrl', function($rootScope, $location, $scope, itinerary, Itinerary) {
  $scope.itinerary = itinerary;

  $scope.save = function() {
    $scope.resetFlash();
    Itinerary.save({itinerary: $scope.itinerary}, function(itinerary) {
      $rootScope.$broadcast('itineraryUpdate');
      $location.path($rootScope.mountPath + '/itineraries/' + itinerary.id + '/edit');
    }, function(response) {
      angular.forEach(response.data.errors, function(k,v) {
        $scope.flash.error += v + " " + k;
      });
    });
  };

  $scope.resetFlash = function() {
    $scope.flash = { error: '', success: ''};
  };
})
.controller('EditItineraryCtrl', function($rootScope, $location, $scope, itinerary, Itinerary) {
  $scope.itinerary = itinerary;

  $scope.save = function() {
    $scope.resetFlash();
    $scope.itinerary.$update(function() {
      $rootScope.$broadcast('itineraryUpdate');
      $scope.flash.success = 'Updated!';
    }, function(response) {
      angular.forEach(response.data.errors, function(k,v) {
        $scope.flash.error += v + " " + k;
      });
    });
  };

  $scope.resetFlash = function() {
    $scope.flash = { error: '', success: ''};
  };

  $scope.addTemplate = function(type) {
    if (type === 'hiking') {
      $scope.itinerary.hiking_templates.push({distance: 0});
    }
  };

  $scope.removeTemplate = function(index) {
    $scope.itinerary.hiking_templates.splice(index, 1);
  };

  $('.date').fdatepicker();
});