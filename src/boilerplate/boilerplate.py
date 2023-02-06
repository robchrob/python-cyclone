from absl import logging

from . import logic
from . import __version__


def main(flags):
    logging.debug("{}".format(__version__))
    logging.info("{}".format(logic.n_prime(flags.num)))

    return 0
