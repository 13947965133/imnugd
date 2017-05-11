var zhuohao;
angular.module('starter.controllers', ['ngStorage','ngAnimate'])
	//首页
.controller('HomeCtrl', function ($scope,$http,$rootScope, $ionicScrollDelegate, $sessionStorage,$interval,$state,$animate) {
	var w2 = location.href.split("?");
	var w3 = w2[1];
	var w4 = w3.split("=");
	if (w4[0] == 'sid') {
		usesid = w4[1];
	}
	document.title="hello2";
	zhuohao = 24;
	$http({
		url:"app_data/"+usesid+".json",
		method:"get"
	}).success(function(data){
		$scope.footList = data;
		$rootScope.leftNum = 1;
		$rootScope.num = {};
		$rootScope.zongjia = 0;
		$rootScope.zongshu = 0;
		$rootScope.shopping = {};
	});

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
		window.location = '#/tab/confirm';
	};
	$interval(function(){});
})
	//详情页
.controller('DetailCtrl',function($scope,$http,$rootScope,$stateParams){
	$scope.footList = {};

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
					zid:zhuohao,
					list: $rootScope.shopping,
					sum: $rootScope.zongjia,
					renshu: $rootScope.personNum,
					zhifu: "已付款",
					fapiao: true,
					beizhu: ''
				}
			}
		}).success(function(data){
			if(data){
				//websocket
				var socket = io('ws://www.imnu.online:8888');
				socket.emit('listmessage',{ sid :'13947965133',list:$rootScope.shopping});
				// setTimeout(function(){window.location = '#/tab/home';},1);
				console.log("提交成功!");
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
