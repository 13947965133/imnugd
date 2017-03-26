#-*- coding:utf-8 -*-
import sys
defaultencoding = 'utf-8'
if sys.getdefaultencoding() != defaultencoding:
    reload(sys)
    sys.setdefaultencoding(defaultencoding)

import psycopg2


def conn(sql):
    conn = psycopg2.connect("dbname = template1 user = postgres")
    cur = conn.cursor()
    cur.execute(sql)
    result = cur.fetchone()
    # data4就是取回的结果集
    conn.commit()
    cur.close()
    conn.close()
    return result
