angular.module('plan-b.location-categories.services', ['ngResource'])
.factory('LocationCategory', function($rootScope, $resource) {
  return $resource($rootScope.mountPath + '/location_categories/:id', { id: '@id' }, { update: { method: 'PUT' }});
});
