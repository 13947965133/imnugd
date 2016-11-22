# -*- coding: UTF-8 -*-
#这是基于用户模块的sql生成器


# 样例数据
# datajson = {'tel':'15771332657','password':'15771332657','newpassword':'newpassword'}
data = {
     'tel':'15771332657'
    ,'password':'15771332657'
    ,'newpassword':'newpassword'}

# 初始化样例变量
tel = data['tel']
password = data['password']
newpassword = data['newpassword']

# 注册账号
# sql = '''INSERT INTO users (tel,password)VALUES ('15771332657','15771332657');'''
def zhuce(tel,password):
    sql = '''INSERT INTO users (tel,password)VALUES ('%s','%s');'''%(tel,password)
    return sql

# 登陆账号
# sql = '''SELECT password FROM users WHERE (tel = '15771332657');'''
def denglu(tel,password):
    sql = '''SELECT password FROM users WHERE (tel = '%s');'''%(tel)
    return sql

# 修改密码
# sql = '''UPDATE users SET password = 'newpassword' WHERE tel = '15771332657';'''
def xiugaimima(newpassword,tel):
    sql = '''UPDATE users SET password = '%s' WHERE tel = '%s';'''%(newpassword,tel)
    return sql

# 本层测试函数
# print zhuce(tel,password)
# print denglu(tel,password)
# print xiugaimima(newpassword,tel)
