# this file runs at the beginning of an interactive session if the
# PYTHONSTARTUP environment variable is set to it's path
# most commonly,
# PYTHONSTARTUP=~/.pythonrc.py # the extension is just for text editors

try:
    import readline
except ImportError:
    pass
import pprint
