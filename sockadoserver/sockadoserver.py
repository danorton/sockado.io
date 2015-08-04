
import logging
import tornado.ioloop
import tornado.web

from .websockhandler import WebSocketHandler

LOGGER = None


class SockadoServer():

    def __init__(
            self,
            logger=None,
            bind_port=80,
            path_re=r'/socket.io',
            ):
        global LOGGER
        if logger is not None:
            LOGGER = logger
        else:
            LOGGER = logging.getLogger('root')
        self._bind_port = bind_port
        self._app = tornado.web.Application([
            tornado.web.url(path_re, WebSocketHandler, kwargs={'logger': LOGGER}),
        ])

    def start(self):
        global LOGGER
        LOGGER.info('+enter()')
        self._app.listen(self._bind_port)
        tornado.ioloop.IOLoop.current().start()
        LOGGER.info('-exit()')
