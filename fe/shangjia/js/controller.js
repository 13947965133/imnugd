angular.module('starter.controllers', ['ngStorage','ngAnimate'])
	//首页
.controller('HomeCtrl', function ($scope,$http,$rootScope,$state,$animate) {
	$scope.fontList = [];
	var socket = io('ws://imnu.online:8888');
	socket.on('sid_13947965133', function (data) {
		$scope.fontList.unshift(data.list);
		console.log($scope.fontList);
		$scope.$apply();
		var audio = document.getElementById("bgMusic");

		//播放(继续播放)
		audio.play();
		console.log("播放音乐");

		//暂停
		// audio.pause();

		//停止
		// audio.pause();
		// audio.currentTime = 0;

		//重新播放
		// audio.currentTime = 0;
		// audio.play();
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
