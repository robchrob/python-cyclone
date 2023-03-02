from absl import logging

from . import logic
from . import __version__


def main(flags):
    logging.debug("v{}".format(__version__))
    logging.info("prime({}) = {}".format(flags.num, logic.n_prime(flags.num)))

    return 0
