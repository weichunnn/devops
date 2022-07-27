import falcon


class HelloResource(object):
    def on_get(self, req, resp):
        resp.status = falcon.HTTP_200
        resp.body = "Hello, World!"


class Page2Resource(object):
    def on_get(self, req, resp):
        resp.status = falcon.HTTP_200
        resp.body = "This is the second page!"


app = falcon.API()

app.add_route("/", HelloResource())
app.add_route("/page2", Page2Resource())
