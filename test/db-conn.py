#-*- coding:utf-8 -*-
import psycopg2
#这是一个python连接pg数据库的连接器

def connectPostgreSQL():
    conn = psycopg2.connect(database="dalian", user="postgres", password="postgres", host="localhost", port="6432")
    print 'connect successful!'

connectPostgreSQL()