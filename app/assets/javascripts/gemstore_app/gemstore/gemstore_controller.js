gemstoreApp.controller('GemstoreCtrl', function($scope) {
  $scope.greeting = 'Flatlander\'s Gem Store';

  $scope.alertGreeting = function() {
    alert($scope.greeting);
  };
});
