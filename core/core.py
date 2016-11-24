# -*- coding: UTF-8 -*-

import users
import conn


def index(data):
    # 初始化样例变量
    global tel
    tel = data['tel']
    global password
    password = data['password']
    global newpassword
    newpassword = data['newpassword']
    global function
    function = data['function']
    func_a = function
    eval(func_a)()
    print func_a,"finish"
    # vars()[func_a]()

def zhuce():
    sql = users.zhuce(tel,password)
    conn.conn1(sql)

def denglu():
    sql = users.denglu(tel,password)
    result = conn.conn0(sql)
    print result

def xiugaimima():
    sql = users.xiugaimima(newpassword,tel)
    result = conn.conn1(sql)
    return result

# zhuce()
# denglu()
# xiugaimima()

# index()
