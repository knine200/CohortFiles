var myApp = angular.module('demoApp', []);

myApp.controller('SimpleController', function($scope) {
    $scope.players = [
        { name: "Johnny Manziel", city: "Cleveland" },
        { name: "Andy Dalton", city: "Cincinnati" },
        { name: "Eli Manning", city: "New York" },
        { name: "Peyton Manning", city: "Denver" }
    ];
});

myApp.controller('FriendsController', function ($scope) {
    $scope.friends = [
        { name: 'John', phone: '555-1212', age: 10 },
        { name: 'Mary', phone: '555-1313', age: 19 },
        { name: 'Mike', phone: '555-1414', age: 21 },
        { name: 'Adam', phone: '555-1515', age: 35 },
        { name: 'Julie', phone: '555-1616', age: 29 }
    ];
});