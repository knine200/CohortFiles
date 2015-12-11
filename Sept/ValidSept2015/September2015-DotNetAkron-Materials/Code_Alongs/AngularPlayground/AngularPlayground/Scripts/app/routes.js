var myApp = angular.module('friendsApp', ['ngRoute']);

myApp.factory('friendsFactory', function($http) {
    var webAPIProvider = {};

    var url = '/api/Friends/';

    webAPIProvider.getFriends = function() {
        return $http.get(url);
    };

    webAPIProvider.saveFriend = function(friend) {
        return $http.post(url, friend);
    };

    return webAPIProvider;
});

myApp.config(function($routeProvider) {
    $routeProvider
        .when('/Routes', {
            controller: 'FriendsController',
            templateUrl: '/AngularViews/FriendsList.html'
        })
        .when('/AddFriend', {
            controller: 'AddFriendController',
            templateUrl: '/AngularViews/AddFriend.html'
        })
        .otherwise({ redirectTo: '/Routes' });
});

myApp.controller('FriendsController', function($scope, friendsFactory) {
    friendsFactory.getFriends()
        .success(function(data) {
            $scope.friends = data;
        })
        .error(function(data, status) {
            alert('oh noes! status: ' + status);
        });
});

myApp.controller('AddFriendController', function($scope, $location, friendsFactory) {
    $scope.friend = {};

    $scope.save = function() {
        friendsFactory.saveFriend($scope.friend)
            .success(function() {
                $location.path('/Routes');
            })
            .error(function(data, status) {
                alert('oh noes! status: ' + status);
            });
    };
})