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

import json
import tornado
import tornado.httpserver
import tornado.ioloop
import tornado.options
import tornado.web
import psycopg2
# from tornado.options import define, options



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
        data3 = json.dumps(data4)
        self.write(data3)

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
                  ],
        template_path=os.path.join(os.path.dirname(__file__), "templates"),
        static_path=os.path.join(os.path.dirname(__file__), "static"),
        debug=True
    )
    app.listen(8000)
    tornado.ioloop.IOLoop.current().start()