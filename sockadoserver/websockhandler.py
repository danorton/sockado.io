
import json
import logging
import tornado.websocket

LOGGER = None


class WebSocketHandler(tornado.websocket.WebSocketHandler):

    def __init__(self, app, request, logger=None, **kwargs):
        global LOGGER
        if logger is not None:
            LOGGER = logger
        else:
            LOGGER = logging.getLogger('root')

        LOGGER.info('+enter()')
        super(WebSocketHandler, self).__init__(app, request, **kwargs)
        self._query_args = {}
        self._query_args['q'] = self.get_query_arguments('q')
        LOGGER.info('query_args=%s', self._query_args)
        LOGGER.info('-exit()')

    def open(self):
        LOGGER.info('+enter()')
        LOGGER.info('-exit()')

    def on_message(self, message):
        LOGGER.debug('+enter(%s)', json.dumps(message))
        LOGGER.debug('-exit()')

    def on_close(self):
        LOGGER.info('+enter()')
        LOGGER.info('-exit()')
