angular.module('plan-b.location-categories.controllers', ['plan-b.location-categories.services'])
.controller('LocationCategoriesCtrl', function($scope, LocationCategory) {

  $scope.loadResources = function() {
    LocationCategory.query(function(locationCategories) {
      $scope.locationCategories = locationCategories;
    }, function(err) {
      console.log("Failed to retrieve location categories");
    });
  };

  $scope.loadResources();

  $scope.add = function() {
    $scope.locationCategories.push({name: 'Name me'});
  };
});