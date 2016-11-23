import tornado.ioloop
import tornado.web
import core
import parser

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("Hello, world")

    def post(self):
         a = self.get_argument('a')
         data = parser.index(a)
         print core.index(data)
         lihui = "11111"
         self.render('list.json',lihui=lihui)



def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
    ])

if __name__ == "__main__":
    app = make_app()
    app.listen(8004)
    tornado.ioloop.IOLoop.current().start()
