import tornado.ioloop
import tornado.web
import core
import parser

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        # self.write("Hello, world")
        self.render('index.html')

    def post(self):
         a = self.get_argument('a')
         data = parser.index(a)
         print core.index(data)
         lihui = "11111"
         self.render('list.json',lihui=lihui)

class UsersMandler(tornado.web.RequestHandler):
    def get(self):
        self.write("hello UsersMandler")
        print "papapa"
    def post(self):
        data = self.get_argument('a')
        print core.index(data)

class DingDanMandler(tornado.web.RequestHandler):
    def get(self):
        self.write("hello DingDanMandler")

    def post(self):
        pass

class CaiDanMandler(tornado.web.RequestHandler):
    def get(self):
        self.write("hello CaiDanMandler")
        print "wwwww"

    def post(self):
        pass

def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
        (r"/users", UsersMandler)
    ])

if __name__ == "__main__":
    app = make_app()
    app.listen(8004)
    tornado.ioloop.IOLoop.current().start()
