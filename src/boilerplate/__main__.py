from absl import app, flags, logging
import sys

from .boilerplate import main

FLAGS = flags.FLAGS
flags.DEFINE_bool("verbose", False, "Verbose mode")


def entry(argv):
    if FLAGS.verbose:
        logging.set_verbosity(logging.DEBUG)

    sys.exit(main(FLAGS))


if __name__ == "__main__":
    app.run(entry)
