# -*- coding: UTF-8 -*-
#json格式的数据解析器
import json

# 样例数据
# data = {
#      'tel':'15771332671'
#     ,'password':'15771332671'
#     ,'token':'abcdefghijklmnopqrstuvwxyz'
#     ,'function':'zhuce'
#     ,'time':'YY-mm-dd'
#     ,'newpassword':'ngggg'}


# 检查非法输入
data =  "{'tel':'15771332677'  ,'password':'15771332677'  ,'token':'abcdefghijklmnopqrstuvwxyz'  ,'function':'zhuce'  ,'time':'YY-mm-dd'  ,'newpassword':'newpassword'}"
def index(data):
    result = eval(data)
    # tel = data['tel']
    # password = data['password']
    # function = data['function']
    # newpassword = data['newpassword']
    return result
