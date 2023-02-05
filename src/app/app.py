from absl import logging

from . import config
from . import math_func


def main(flags):
    fib_out = math_func.fibonacci(flags.fib)
    collatz_out = math_func.collatz_element(flags.collatz)

    logging.debug("{}".format(flags.title))
    logging.info("[fib={} ; collatz={}]".format(fib_out, collatz_out))

    return 0
