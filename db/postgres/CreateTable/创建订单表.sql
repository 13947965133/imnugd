-- pg库中创建的订单表

CREATE TABLE  list(
   sid varchar(16),
   zid int,
   list json,
   beizhu text,
   sfzf   boolean,
   fapiao boolean,
   sj     timestamp,

);

插入的记录

INSERT INTO ddb (list,sid,zhuohao,beizhu,sfzf,sj,fapiao,sum)
VALUES ('[
  {"name":["num","total","size","attr1"]}
  ,{"商品名称":["个数","总价","规格","属性"]}

]',
'18947129292',003,'',TRUE,'2017-1-31 13:20:07',TRUE,80);

查询商家
select * from ddb where sid='18947129292';