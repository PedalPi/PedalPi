import tornado

from load_module import load_module

load_module('application')
load_module('webservice')
load_module('physical')

from application.Application import Application
from webservice.WebService import WebService
from physical.physical import Physical

address = 'raspberrypi.local'
#address = '10.0.0.102'
port = 3000

application = Application(data_patch="data/", address=address, test=True)
webService = WebService(application)
physical = Physical(application, test=False)

app = webService.prepare()
app.listen(port)

print("PedalController API REST      localhost:" + str(port))
print("PedalController API WebSocket localhost:" + str(port) + "/ws")

tornado.ioloop.IOLoop.current().start()
