#-*- coding:utf-8 -*-
import sys
defaultencoding = 'utf-8'
if sys.getdefaultencoding() != defaultencoding:
    reload(sys)
    sys.setdefaultencoding(defaultencoding)

import os.path
import random
from db import conn

import json
import tornado
import tornado.httpserver
import tornado.ioloop
import tornado.options
import tornado.web
from tornado.options import define, options


class MainHandler(tornado.web.RequestHandler):
    def get(self):
        sql = "select * from `shangjia` limit 3;"
        data4 = conn.conn0(sql)
        # data3 = data4[0]
        items = [
              "<div><a href='#'><li class='online'>品牌馆</li></a></div>"
            , "<a href='#'><li class='online'>小吃快餐</li></a>"
            , "<a href='#'><li class='online'>早餐</li></a>"
            , "<a href='#'><li class='online'>地方菜</li></a>"
            , "<a href='#'><li class='online'>西式快餐</li></a>"
            , "<a href='#'><li class='online'>异国风味</li></a>"
            , "<a href='#'><li class='online'>中式正餐</li></a>"
            , "<a href='#'><li class='online'>烧烤海鲜</li></a>"]

        self.render("template.html", title="大连美食广场主页", items=items,datas=data4)
class DandianHandler(tornado.web.RequestHandler):
    def get(self):
        self.render("dandian.html")

    def post(self):
        pass

class ShangjiaHandler(tornado.web.RequestHandler):
    def get(self):
        title = "大连"
        self.render("shangjia.html",title=title)

    def post(self):
        data = self.get_argument('data')
        self.render("shangjia.json",xiugai=data)

class BdwmHandler(tornado.web.RequestHandler):
    def get(self):
        sql = "select * from `shangjia` limit 3;"
        data4 = conn.conn0(sql)
        data3 = data4[0]
        self.render("baiduwaimai.html",datas=data3)

    def post(self):
        pass

class ZhuceHandler(tornado.web.RequestHandler):
    def get(self):
        self.render("zhuce.html")

    def post(self):
        tel = self.get_argument('tel')
        yanzheng = self.get_argument('yanzheng')
        password = self.get_argument('password')
        sql = '''INSERT INTO `user`(`uid`, `upd`) VALUES ("%s","%s");'''%(tel,password)
        data4 = conn.conn1(sql)
        if data4==None:
            data5 = "success"
        else:
            data5 = "default"
        print data4
        self.render("shangjia.json",code= data5, tel=tel,yanzheng=yanzheng,password=password)

class DengluHandler(tornado.web.RequestHandler):
    def get(self):
        self.render("denglu.html")
    def post(self):
        tel = self.get_argument('tel')
        password = self.get_argument('password')
        sql = '''SELECT `upd` FROM user WHERE (`uid`="%s");''' % (tel)
        data4 = conn.conn0(sql)
        data3 = data4[0]
        data2 = data3[0]
        if data2 == password:
            data1 = 1
        else:
            data1 = 0
        self.render("denglu.json",code = "200",message=data1)

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

class AddressHandler(tornado.web.RequestHandler):
    def get(self):
        self.render("mui/address.html")

class EnenHandler(tornado.web.RequestHandler):
    def get(self):
        name = tornado.escape.xhtml_escape(self.current_user)
        self.write("Hello, " + name)

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
                  (r'/dandian', DandianHandler),
                  (r'/shangjia',ShangjiaHandler),
                  (r'/bdwm', BdwmHandler),
                  (r'/zhuce',ZhuceHandler),
                  (r'/denglu', DengluHandler),
                  (r'/address', AddressHandler),
                  (r'/enen', EnenHandler),
                  (r'/(favicon.ico)', tornado.web.StaticFileHandler, {"path": "./ico.ico"}),
                  ],
        template_path=os.path.join(os.path.dirname(__file__), "templates"),
        static_path=os.path.join(os.path.dirname(__file__), "static"),
        debug=True
    )
    app.listen(8000)
    tornado.ioloop.IOLoop.current().start()