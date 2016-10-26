import tornado

from load_module import load_module

load_module('application')
load_module('webservice')
load_module('physical')

from application.Application import Application
from webservice.WebService import WebService
from physical.controller.pedal_zero_controller.simple_patch_gpio_zero_controller import SimplePatchGpioZeroController
from physical.controller.android_controller.android_controller import AndroidController

address = 'raspberrypi.local'
#address = '10.0.0.102'
port = 3000

application = Application(data_patch="data/", address=address, test=True)

application.register(WebService(application, port))
application.register(SimplePatchGpioZeroController(application, test=True))
#application.register(AndroidController(application, "adb"))
#application.register(AndroidController(application, "~/Desktop/adb-arm/adb-rpi3"))

application.start()

tornado.ioloop.IOLoop.current().start()
