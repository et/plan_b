angular.module('plan-b.location-categories.controllers', ['plan-b.location-categories.services'])
.controller('LocationCategoriesCtrl', function($rootScope, $scope, LocationCategory) {

  $scope.loadResources = function() {
    LocationCategory.query(function(locationCategories) {
      $scope.locationCategories = locationCategories;
    }, function(err) {
      console.log("Failed to retrieve location categories");
    });
  };

  $scope.$on('locationCategoryUpdate', function() {
    $scope.loadResources();
  });

  $scope.loadResources();

  $scope.add = function() {
    LocationCategory.save( { location_category: { name: $scope.newLocationCategoryName } }, function(locationCategory) {
      $rootScope.$broadcast('locationCategoryUpdate');
    }, function(response) {
      console.log("error");
    }
    );
  };
});