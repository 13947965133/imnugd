#-*- coding:utf-8 -*-
import sys
defaultencoding = 'utf-8'
if sys.getdefaultencoding() != defaultencoding:
    reload(sys)
    sys.setdefaultencoding(defaultencoding)

import psycopg2

##连接到一个存在的数据库
conn = psycopg2.connect("dbname = template1 user = postgres")
##connect（）建立一个新的数据库会话，并返回一个connect实例

##打开一个光标，用来执行数据库操作
cur = conn.cursor()

##执行命令：建立一个新表

# cur.execute("CREATE TABLE test(id serial PRIMARY KEY, num integer, data varchar);")

##传递数据用来填充查询占位符， 让Psycopg执行正确的转换（不再有SQL注入）

# cur.execute("INSERT INTO test(num, data) VALUES('%s', '%s');"% (100, "abc,def ") )

##查询数据库，取得数据作为python对象

cur.execute("SELECT * FROM shangjia;")
data4 = cur.fetchone()


# data4就是取回的结果集

##使改变永久存入数据库
conn.commit()
##关闭到数据库的通信
cur.close()
conn.close()