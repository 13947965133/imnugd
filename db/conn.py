#-*- coding:utf-8 -*-

import mysql.connector


config={'host':'127.0.0.1',#默认127.0.0.1
        'user':'root',
        'password':'root',
        'port':3306 ,#默认即为3306
        'database':'dalian2',
        'charset':'utf8'#默认即为utf8
        }
try:
  cnn=mysql.connector.connect(**config)
except mysql.connector.Error as e:
  print('connect fails!{}'.format(e))

# 可执行查询操作
def conn0(sql):
    try:
        conn = mysql.connector.connect(**config)
        cursor = conn.cursor()
        cursor.execute(sql)
        result = cursor.fetchall()
        return result
    except mysql.connector.Error as e:
        print('conn0 fails!{}'.format(e))
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
