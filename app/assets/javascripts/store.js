// = require_self
//= require_tree ./store_app
// array below is for injectables/ directives?
(function() {
var app = angular.module('GemStore', ["StoreDirectives"])
app.config(['$httpProvider', function($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]')
    .attr('content');
    $httpProvider.defaults.headers.common.Accept = 'application/json';
  }]);
})();
