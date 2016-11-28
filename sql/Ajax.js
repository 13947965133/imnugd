jQuery.ajax({
url: "http://localhost:8004/", success: function(results) {
var parsedJson = jQuery.parseJSON(results);
alert(parsedJson);
}
});

$.postJSON("http://localhost:8004/",{"a": "{'tel':'15771332671','password':'15771332671','token':'abcdefghijklmnopqrstuvwxyz','function':'zhuce','time':'YY-mm-dd','newpassword':'newpassword'}"},function(data){
//此处返回的data已经是json对象
//以下其他操作同第一种情况
$.each(data.root,function(idx,item){
if(idx==0){
return true;//同countinue，返回false同break
}

alert("name:"+item.tel+",value:"+item.password);

});
});


var jsonStr = '{"name":"leinov","sex":"famle","address":"beijing"}'
var jsonObj = JSON.parse(jsonStr);
alert(typeof jsonObj.name); //Object

var str = '{"name":"jack"}';
var obj = JSON.parse(str); // --> parse error
alert(obj.name);
