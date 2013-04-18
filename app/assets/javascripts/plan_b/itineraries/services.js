angular.module('plan-b.itineraries.services', ['ngResource'])
.factory('Itinerary', function($rootScope, $resource) {
  return $resource($rootScope.mountPath + '/itineraries/:id', { id: '@id' }, { update: { method: 'PUT' }});
});
