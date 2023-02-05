from absl import app, flags, logging
import sys

from .app import main

FLAGS = flags.FLAGS
flags.DEFINE_string("title", "python-boilerplate v0.0.1", "Header to show.")
flags.DEFINE_integer("fib", None, "Print n-th fibbonacci.", lower_bound=0)
flags.DEFINE_integer("collatz", None, "Print n-th collatz.", lower_bound=0)
flags.DEFINE_boolean("debug", False, "Produces debugging output.")

flags.mark_flag_as_required("fib")
flags.mark_flag_as_required("collatz")


def entry(argv):
    if FLAGS.debug:
        logging.set_verbosity(logging.DEBUG)

    sys.exit(main(FLAGS))


if __name__ == "__main__":
    app.run(entry)
