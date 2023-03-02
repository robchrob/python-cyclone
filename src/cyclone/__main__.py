from absl import app, flags, logging
import sys

from .cyclone import main

FLAGS = flags.FLAGS
flags.DEFINE_integer("num", None, "Nth prime number.", lower_bound=1)
flags.DEFINE_bool("verbose", False, "Verbose mode")

flags.mark_flag_as_required("num")


def entry(argv):
    if FLAGS.verbose:
        logging.set_verbosity(logging.DEBUG)

    sys.exit(main(FLAGS))


if __name__ == "__main__":
    app.run(entry)
