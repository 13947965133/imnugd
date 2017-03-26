-- psql中的商家信息表
CREATE TABLE shangjia(sid varchar(13),spd varchar(16),sico varchar(128),list json);

INSERT INTO shangjia (sid,spd,sico,list) VALUES ('15771337133','15771337133','md5-img-url',
'[
  {
    "listName": "♥热门",
    "listID": "1",
    "list": [{
      "id": "1",
      "name": "秀火锅",
      "num": "0",
      "jiage": "13",
      "profile": "这个火锅真好吃",
      "img": "images/m1.jpg"
    }, {
      "id": "2",
      "name": "麻辣烫",
      "num": "0",
      "jiage": "15",
      "profile": "这个麻辣烫真好吃",
      "img": "images/m2.jpg"
    }, {
      "id": "3",
      "name": "红烧牛肉",
      "num": "0",
      "jiage": "20",
      "profile": "这个牛真好吃",
      "img": "images/m8.jpg"
    }]
  },{
  "listName": "♥肉",
  "listID": "2",
  "list": [{
    "id": "1",
    "name": "秀火锅",
    "num": "0",
    "jiage": "13",
    "profile": "这个火锅真好吃",
    "img": "images/m1.jpg"
  }, {
    "id": "2",
    "name": "麻辣烫",
    "num": "0",
    "jiage": "15",
    "profile": "这个麻辣烫真好吃",
    "img": "images/m2.jpg"
  }, {
    "id": "3",
    "name": "红烧牛肉",
    "num": "0",
    "jiage": "20",
    "profile": "这个牛真好吃",
    "img": "images/m8.jpg"
  }]
}, {
  "listName": "★新菜",
  "listID": "3",
  "list": [{
    "id": "4",
    "name": "香蕉",
    "num": "0",
    "jiage": "13",
    "profile": "这个火锅真好吃",
    "img": "images/m6.jpg"
  }, {
    "id": "5",
    "name": "麻辣烫",
    "num": "0",
    "jiage": "15",
    "profile": "这个麻辣烫真好吃",
    "img": "images/m5.jpg"
  }, {
    "id": "6",
    "name": "红烧牛肉",
    "num": "num",
    "jiage": "20",
    "profile": "这个牛真好吃",
    "img": "images/m6.jpg"
  }, {
    "id": "5",
    "name": "麻辣烫",
    "num": "0",
    "jiage": "15",
    "profile": "这个麻辣烫真好吃",
    "img": "images/m5.jpg"
  }, {
    "id": "5",
    "name": "麻辣烫",
    "num": "0",
    "jiage": "15",
    "profile": "这个麻辣烫真好吃",
    "img": "images/m5.jpg"
  }, {
    "id": "5",
    "name": "麻辣烫",
    "num": "0",
    "jiage": "15",
    "profile": "这个麻辣烫真好吃",
    "img": "images/m5.jpg"
  }, {
    "id": "6",
    "name": "红烧牛肉",
    "num": "0",
    "jiage": "20",
    "profile": "这个牛真好吃",
    "img": "images/m6.jpg"
  }]
}
]'
);