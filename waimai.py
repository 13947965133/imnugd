#-*- coding:utf-8 -*-
import sys
defaultencoding = 'utf-8'
if sys.getdefaultencoding() != defaultencoding:
    reload(sys)
    sys.setdefaultencoding(defaultencoding)

import os.path
# import random
from db import conn
from db import connpg

import time
import json
import tornado
import tornado.httpserver
import tornado.ioloop
import tornado.options
import tornado.web
import psycopg2
# from tornado.options import define, options


class AdminDandianHandler(tornado.web.RequestHandler):
    def get(self):
        sql = "SELECT `sid`,`sname`,`s_ico`,`s3`,`s4`,`s17`,`s16` FROM `shangjia`;"
        data4 = conn.conn0(sql)
        thead = ["商家ID","商家名称", "商家图标", "商家简介","星级","联系电话","地址"]
        self.render("admin/admindata.html",thead=thead,data4=data4)
    def post(self, *args, **kwargs):
        data = self.get_argument('data')
        # data_dict = data
        data_dict = json.loads(data)
        print data_dict['def']
        if data_dict['def'] == 'update':
            sql = "UPDATE `shangjia` SET sname='%s',s_ico='%s',s3='%s',s4='%s',s17='%s',s16='%s' WHERE sid = '%s';"%(data_dict['sname'],data_dict['s_ico'],data_dict['s3'],data_dict['s4'],data_dict['s17'],data_dict['s16'],data_dict['sid'])
            conn.conn1(sql)
            print sql
        elif data_dict['def'] == 'delete':
            pass
            #执行删除操作
        elif data_dict['def'] == 'insert':
            pass
            #执行插入操作
        else:
            print "400,非法请求"
        self.write("200")



class IndexHandler(tornado.web.RequestHandler):
    def get(self):
        sql = "SELECT * FROM `shangjia`;"
        data4 = conn.conn0(sql)
        self.render("mui/index.html",data4 = data4)

    def post(self, *args, **kwargs):
        a = self.get_argument('a')#用于ajax接收筛选条件
        sql = "SELECT * FROM `shangjia`;"
        data4 = conn.conn0(sql)
        self.render("mui/index.html", data4=data4)

class Index2Handler(tornado.web.RequestHandler):
    def get(self):
        #此处处理方式有机会改成json对象存储，二维表浪费空间，而且性能并不高
        sid = self.get_argument('sid')
        sname = self.get_argument('sname')
        #读取商家的名称、图标、起送、配送、送达、广播
        sql3 = "SELECT * FROM `shangjia` WHERE (sid='%s')"%(sid)
        data12 = conn.conn0(sql3)
        #读取菜单类型
        sql1 = "SELECT DISTINCT `lei` FROM `list_%s`"%(sid)
        data4 = conn.conn0(sql1)
        #读取菜单
        sql2 = "SELECT `one` FROM `list_%s`"%(sid)
        data6 = conn.conn0(sql2)

        self.render("mui/index2.html",d12s=data12,d8s = data4,d10s = data6,sname=sname)

class Index3Handler(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        self.render("mui/index3.html")

class ListHandler(tornado.web.RequestHandler):
    def get(self):
        uid = "15771332671"
        upd = "15771332671"
        sql1 = "SELECT `u2` FROM `user` WHERE(uid='%s' AND upd='%s')" % (uid,upd)
        data4 = conn.conn0(sql1)
        self.render("mui/list2.html",d8 = data4)

class MeHandler(tornado.web.RequestHandler):
    def get(self):
        uid = "15771332671"
        upd = "15771332671"
        sql = "SELECT * FROM `user` WHERE (uid='%s' AND upd='%s' )" % (uid,upd)
        data4 = conn.conn0(sql)
        self.render("mui/me.html",data4=data4)


class GetlistHandler(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        self.render('angular/getlist.html')
    def post(self, *args, **kwargs):
        self.set_header("Access-Control-Allow-Origin", "*")
        self.set_header("Access-Control-Allow-Headers", "x-requested-with")
        self.set_header('Access-Control-Allow-Methods', 'POST, GET, OPTIONS')
        sid = self.get_argument('sid')
        sql = "SELECT * FROM shangjia WHERE sid='%s';"%(sid)
        print sql
        data4 = connpg.conn(sql)
        # data3 = json.dumps(data4)
        self.write(data4)

class ReceivedListHandler(tornado.web.RequestHandler):
    def post(self, *args, **kwargs):
        self.set_header("Access-Control-Allow-Origin", "*")
        self.set_header("Access-Control-Allow-Headers", "x-requested-with")
        self.set_header('Access-Control-Allow-Methods', 'POST, GET, OPTIONS')
        data = self.get_argument('data')
        # sql = '''INSERT INTO list(sid,list,sum,renshu,zhifu,fapiao,beizhu,time)'
        #       'VALUES ('%s','%s'::json
        #         ,'%s',%s,%s,%s,'%s',now());'''%(sid,list,sum,renshu,zhifu,fapiao,beizhu)
        # data4 = connpg.conn(sql)
        self.write("True")

if __name__ == "__main__":
    tornado.options.parse_command_line()
    settings = {
        "cookie_secret": "61oETzKXQAGaYdkL5gEmGeJJFuYh7EQnp2XdTP1o/Vo=",
        "login_url": "/login",
    }
    app = tornado.web.Application(
        handlers=[
            (r"/", tornado.web.RedirectHandler, {"url": "/index", "permanent": False}),
                  (r'/index', IndexHandler),
                  (r'/index2', Index2Handler),
                  (r'/index3', Index3Handler),
                  (r'/list', ListHandler),
                  (r'/me', MeHandler),
                  (r'/(favicon.ico)', tornado.web.StaticFileHandler, {"path": "./ico.ico"}),
            #新代码
                  (r'/admin', AdminDandianHandler),
                  (r'/getlist', GetlistHandler),
                  (r'/receivedlist', ReceivedListHandler),
                  ],
        template_path=os.path.join(os.path.dirname(__file__), "templates"),
        static_path=os.path.join(os.path.dirname(__file__), "static"),
        debug=True
    )
    app.listen(8000)
    tornado.ioloop.IOLoop.current().start()