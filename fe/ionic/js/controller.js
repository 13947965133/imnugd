angular.module('starter.controllers', ['ngStorage','ngAnimate'])
	//首页
.controller('HomeCtrl', function ($scope,$http,$rootScope, $ionicScrollDelegate, $sessionStorage,$interval,$state,$animate) {
	//$http({
	//	url:"http://imnu.online:8000/getlist",
	//	method:"post",
	//	params:{sid:"15771337133"}
	//}).success(function(data){
	//	$scope.footList = JSON.parse(data[3]);
	//});
	$http({
		url:"app_data/list.json",
		method:"get"
	}).success(function(data){
		$scope.footList = data
	});
	$rootScope.leftNum = 1;
	$rootScope.num = {};
	$rootScope.zongjia = 0;
	$rootScope.zongshu = 0;
	$rootScope.shopping = {};
	$scope.plus = function (x) {
		$rootScope.num[x.id] = $rootScope.num[x.id]?++$rootScope.num[x.id]:1;
		$rootScope.zongshu++;
		$rootScope.zongjia += Number(x.jiage);
		if($rootScope.shopping[x.id]){
			$rootScope.shopping[x.id].num++;
		}else{
			$rootScope.shopping[x.id] = {
				id: x.id,
				name: x.name,
				num: 1,
				jiage: x.jiage
			};
		}
	};
	$scope.minus = function (x) {
		$rootScope.num[x.id]--;
		$rootScope.zongshu--;
		$rootScope.zongjia -= Number(x.jiage);
		$rootScope.shopping[x.id].num--;
		if($rootScope.shopping[x.id].num == 0){
			delete $rootScope.shopping[x.id];
		}
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
	$scope.show = false;
	$scope.shop = function(){
		$scope.show = !$scope.show;
	};
	$rootScope.personNum = 2;
	$scope.statements = function(){
		window.location = '#tab/confirm';

		//console.log(toString($scope.shopping))
		//$http({
		//	url: 'http://imnu.online:8000/receivedlist',
		//	method: 'post',
		//	params: {
		//		data: $scope.shopping
		//	}
		//
		//}).success(function(data){
		//	console.log(data)
		//});
	};
	$interval(function(){});
})
	//详情页
.controller('DetailCtrl',function($scope,$http,$rootScope,$stateParams){
	$scope.footList = {};
	//$http({
	//	url:"http://imnu.online:8000/getlist",
	//	method:"post",
	//	params:{sid:"15771337133"}
	//}).success(function(data){
	//	var footData = JSON.parse(data[3]);
	//	for(var i = 0;i < footData.length;i++){
	//		for(var j = 0;j < footData[i].list.length;j++){
	//			if(footData[i].list[j].id == $stateParams.id){
	//				$scope.footList = footData[i].list[j];
	//				break;
	//			}
	//		}
	//	}
	//});
	$http({
		url:"app_data/list.json",
		method:"get"
	}).success(function(data){
		for(var i = 0;i < data.length;i++){
			for(var j = 0;j < data[i].list.length;j++){
				if(data[i].list[j].id == $stateParams.id){
					$scope.footList = data[i].list[j];
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
.controller('ConfirmCtrl',function($scope,$rootScope,$http){
	$rootScope.personNum = 2;
	$scope.back = function(){
		window.location = '#/tab/home';
	};
	$scope.personPlus = function(){
		$rootScope.personNum++;
	};
	$scope.personMinus = function(){
		$rootScope.personNum--;
	}
	//var data
	$scope.tijiao = function(){
		$http({
			url: 'http://imnu.online:8000/receivedlist',
			method: 'post',
			params: {
				data:{
					sid: '15771337133',
					list: $rootScope.shopping,
					sum: $rootScope.zongjia,
					renshu: $rootScope.personNum,
					zhifu: true,
					fapiao: true,
					beizhu: ''
				}
			}
		}).success(function(data){
			if(data){
				//websocket
				var socket = io('ws://www.imnu.online:8888');
				socket.emit('listmessage',{ sid :'13947965133',list:$rootScope.shopping});
			}
		});
	}
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
