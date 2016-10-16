import tornado

from load_module import load_module

load_module('application')
load_module('webservice')
load_module('physical')

from application.Application import Application
from webservice.WebService import WebService
from physical.physical import Physical

address = 'localhost' # '10.0.0.203'

application = Application(data_patch="data/", address=address, test=True)
webService = WebService(application)
physical = Physical(application, test=False)

app = webService.prepare()
app.listen(3000)

print("PedalController API REST      localhost:3000")
print("PedalController API WebSocket localhost:3000/ws")

tornado.ioloop.IOLoop.current().start()
