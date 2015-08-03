
import logging

LOGGER = logging.getLogger('root')


class SockadoServer(object):

    def __init__(self,
                 logger=None,
                 bind_port=80,
                 ):
        global LOGGER
        if logger is not None:
            LOGGER = logger

    def start(self):
        global LOGGER
        LOGGER.info('start()')
