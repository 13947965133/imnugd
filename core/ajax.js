function xieru(){
  $.post("http://localhost:8004/",
  {
    "a": "{'tel':'15771332671','password':'15771332671','token':'abcdefghijklmnopqrstuvwxyz','function':'zhuce','time':'YY-mm-dd','newpassword':'newpassword'}"
  },
  function(data,status){
    var jsonStr = data;
    jsonObj = JSON.parse(jsonStr);
    var tel = jsonObj.tel;
    str_1 = tel;
    // alert(str_1);
    $("#neirong").append("sss"+tel);
    return tel;
  });
  // $("#neirong").append("ttt");
}

$("#denglu").click(function(){

    $.post("http://localhost:8004/",
    {
      "a": "{'tel':'15771332671','password':'15771332671','token':'abcdefghijklmnopqrstuvwxyz','function':'zhuce','time':'YY-mm-dd','newpassword':'newpassword'}"
    },
    function(data,status){
      var jsonStr = data;
      jsonObj = JSON.parse(jsonStr);
      var tel = jsonObj.tel;
      $("#neirong").append(tel);
      return tel;
    });

 });
