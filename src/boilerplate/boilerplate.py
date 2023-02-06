from absl import logging

from . import logic


def main(flags):
    logging.debug("{}".format(flags.title))
    logging.info("{}".format(logic.n_prime(flags.num)))

    return 0
