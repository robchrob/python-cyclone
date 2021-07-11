from absl import logging
import sys

from . import config
from . import math_func


def entry(flags):
    conf = config.Config(flags)

    if conf.debug:
        logging.set_verbosity(logging.DEBUG)

    out = main(conf)

    sys.exit(out)


def main(conf):
    fib_out = math_func.fibonacci(conf.fib)
    collatz_out = math_func.collatz_element(conf.collatz)

    logging.debug("{}".format(conf.title))
    logging.info("[fib={} ; collatz={}]".format(fib_out, collatz_out))

    return 0
