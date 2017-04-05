-- pg库中创建的订单表

CREATE TABLE  list(
   sid varchar(16),  --商家id
   list json, --主体订单json
   sum money,
   renshu int, --用餐人数
   zhifu   boolean,  --是否支付
   fapiao boolean, --是否索要发票
   beizhu text, --备注信息
   time     timestamp  --下单时间
);

-- 插入的记录

INSERT INTO list(sid,list,sum,renshu,zhifu,fapiao,beizhu,time)
VALUES ('15771337133','[
  {"name":["num","total","size","attr1"]}
  ,{"商品名称":["个数","总价","规格","属性"]}
]'::json
,'120',4,TRUE,TRUE,'备注信息',now());
-- 2017-1-31 13:20:07

查询商家
select * from ddb where sid='18947129292';