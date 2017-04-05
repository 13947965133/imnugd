angular.module('starter.controllers', ['ngStorage','ngAnimate'])
	//首页
.controller('HomeCtrl', function ($scope,$http,$rootScope,$state,$animate) {
	$scope.fontList = [];
	var socket = io('ws://imnu.online:8888');
	socket.on('sid_13947965133', function (data) {
		$scope.fontList.unshift(data.list);
		console.log($scope.fontList);
		$scope.$apply();
	});
})

	//获取每一个list的位置
.directive('lastIndex',function($rootScope){
	$rootScope.arr = [];
	return {
		restrict: 'A',
		link: function(scope,element,attr){
			if(scope.$first){
				$rootScope.arr.push(element.parent().parent().position().top);
			}
		}
	}
})
