angular.module('starter.controllers', ['ngStorage','ngAnimate'])
	//首页
.controller('HomeCtrl', function ($scope,$http,$rootScope, $ionicScrollDelegate, $sessionStorage,$interval,$state,$animate) {
	$http({
		url:"http://imnu.online:8000/getlist",
		method:"post",
		params:{sid:"15771337133"}
	}).success(function(data){
		$scope.footList = JSON.parse(data[3]);
	});
	$rootScope.leftNum = 1;
	$rootScope.num = {};
	$rootScope.zongjia = 0;
	$rootScope.zongshu = 0;
	$scope.plus = function (x) {
		$rootScope.num[x.id] = $rootScope.num[x.id]?++$rootScope.num[x.id]:1;
		$rootScope.zongshu++;
		$rootScope.zongjia += Number(x.jiage);
	};
	$scope.minus = function (x) {
		$rootScope.num[x.id]--;
		$rootScope.zongshu--;
		$rootScope.zongjia -= Number(x.jiage);
	};
	$scope.jump = function (id) {
		window.location = '#/tab/detail/'+id;
	};
	$scope.onScroll = function(){
		var scrollTop = $ionicScrollDelegate.$getByHandle('scrollRight').getScrollPosition().top;
		var num = 0;
		for(var i = 0;i < $rootScope.arr.length;i++){
			if(scrollTop >= $rootScope.arr[i]){
				num = i;
			}
		}
		$rootScope.leftNum = num+1;
	};
	$scope.dian = function(id){
		$rootScope.leftNum = id;
		$ionicScrollDelegate.$getByHandle('scrollRight').scrollTo(0,$rootScope.arr[id-1],'ease');
	};
	$interval(function(){});
})
	//详情页
.controller('DetailCtrl',function($scope,$http,$rootScope,$stateParams){
	$scope.footList = [{
		id: 1,
		name: "秀火锅",
		num: 0,
		jiage:13,
		profile: "这个火锅真好吃",
		img: "images/m1.jpg"
	}];
	$http({
		url:"http://imnu.online:8000/getlist",
		method:"post",
		params:{sid:"15771337133"}
	}).success(function(data){
		var footData = JSON.parse(data[3]);
		for(var i = 0;i < footData.length;i++){
			for(var j = 0;j < footData[i].list.length;j++){
				if(footData[i].list[j].id == $stateParams.id){
					$scope.footList = footData[i].list[j];
					break;
				}
			}
		}
	});
	$scope.plus = function (x) {
		$rootScope.num[x.id] = $rootScope.num[x.id]?++$rootScope.num[x.id]:1;
		$rootScope.zongshu++;
		$rootScope.zongjia += Number(x.jiage);
	};
	$scope.minus = function (x) {
		$rootScope.num[x.id]--;
		$rootScope.zongshu--;
		$rootScope.zongjia -= Number(x.jiage);
	};
	$scope.back = function(){
		window.location = '#/tab/home';
	};
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
