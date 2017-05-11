    $('body').on('click','.jia-anmin-d',function(){
        // $(this).parent().parent().children('.item').children('img').animate({width:"300px"});
        var img = $(this).parent().parent().children('.item').children('img').attr('src'); //获取当前点击图片链接
        var flyer = $('<img style="width:40px;height:40px;position:absolute; z-index:1000;border-radius:25px; overflow:hidden;" class="flyer-img" src="' + img + '">'); //抛物体对象
        flyer.fly({
            start: {
                left: event.pageX,//抛物体起点横坐标
                top: event.pageY //抛物体起点纵坐标
            },
            end: {
                left: $(".ion-ios-cart").offset().left + 10,//抛物体终点横坐标
                top: $(".ion-ios-cart").offset().top + 10, //抛物体终点纵坐标
            },
            onEnd: function() {
                $(".shopping").show().animate({width: '200px'},300).fadeOut(500);////成功加入购物车动画效果
                $("body").children("img.flyer-img").fadeOut("4000");
                setTimeout(function(){$("body").children("img.flyer-img").remove();},3000);
                // this.destory(); //销毁抛物体
            }
        });
    });

    $('body').on('click','.jian-anmin-d',function(){
      // $(this).parent().parent().children('.item').children('img').animate({width:"60px"});
      var img = $(this).parent().parent().children('.item').children('img').attr('src'); //获取当前点击图片链接
      var flyer = $('<img style="width:40px;height:40px;position:absolute; z-index:1000;border-radius:25px; overflow:hidden;" class="flyer-img" src="' + img + '">'); //抛物体对象
      flyer.fly({
          start: {
            left: $(".ion-ios-cart").offset().left + 10,//抛物体终点横坐标
            top: $(".ion-ios-cart").offset().top + 10, //抛物体终点纵坐标
          },
          end: {
            left: event.pageX,//抛物体起点横坐标
            top: event.pageY //抛物体起点纵坐标
          },
          onEnd: function() {
              $(".shopping").show().animate({width: '200px'},300).fadeOut(500);////成功加入购物车动画效果
              $("body").children("img.flyer-img").fadeOut("4000");
              setTimeout(function(){$("body").children("img.flyer-img").remove();},3000);
              // this.destory(); //销毁抛物体
          }
      });
    });
