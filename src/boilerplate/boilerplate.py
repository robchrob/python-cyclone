from absl import logging

from . import leetcoder
from . import __version__


def main(flags):
    logging.debug("v{}".format(__version__))
    logging.version("v{}".format(__version__))

    return 0
