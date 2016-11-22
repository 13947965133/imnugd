# -*- coding: UTF-8 -*-
#这是一个mysql的sql语句执行器

import mysql.connector

config={'host':'127.0.0.1',#默认127.0.0.1
        'user':'root',
        'password':'root',
        'port':3306 ,#默认即为3306
        'database':'yunhao',
        'charset':'utf8'#默认即为utf8
        }

# sql = "SELECT * FROM users"
# sql = '''INSERT INTO users (tel,password)VALUES ('15771332697','15771332697');'''

# 可执行查询操作
def conn0(sql):
    try:
        conn = mysql.connector.connect(**config)
        cursor = conn.cursor()
        cursor.execute(sql)
        result = cursor.fetchall()
        return result
    except mysql.connector.Error as e:
        print('connect fails!{}'.format(e))
    finally:
        cursor.close()
        conn.close()

# 可执行更新操作
def conn1(sql):
    try:
        conn = mysql.connector.connect(**config)
        cursor = conn.cursor()
        cursor.execute(sql)
        conn.commit()
    except mysql.connector.Error as e:
        print('connect fails!{}'.format(e))
    finally:
        cursor.close()
        conn.close()


# test conn(sql)函数
# print conn(sql)
# print conn1(sql)
