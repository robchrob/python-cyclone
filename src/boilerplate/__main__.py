from absl import app, flags, logging
import sys

from .boilerplate import main

FLAGS = flags.FLAGS
flags.DEFINE_string("title", "python-boilerplate v0.0.1", "Header to show")
flags.DEFINE_integer("num", None, "Nth prime number.", lower_bound=1)
flags.DEFINE_bool("debug", True, "Verbose mode")

flags.mark_flag_as_required("num")


def entry(argv):
    if FLAGS.debug:
        logging.set_verbosity(logging.DEBUG)

    sys.exit(main(FLAGS))


if __name__ == "__main__":
    app.run(entry)
