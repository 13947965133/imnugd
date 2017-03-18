/**
 * Created by guohan on 2016/12/17.
 */
$.post("http://localhost/shangjia",
                    {
                        "a": "{'tel':'15771332671','password':'15771332671','token':'abcdefghijklmnopqrstuvwxyz','function':'zhuce','time':'YY-mm-dd','newpassword':'newpassword'}"
                    },
                function(data,status){
                    alert("数据: \n" + data + "\n状态: " + status);
                });