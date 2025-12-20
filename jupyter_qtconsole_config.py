# Configuration file for qtconsole.

from platform import system

c = get_config()  #noqa

#------------------------------------------------------------------------------
# ConsoleWidget configuration
## An abstract base class for console-type widgets. This class has
#   functionality for:
#
#       * Maintaining a prompt and editing region
#       * Providing the traditional Unix-style console keyboard shortcuts
#       * Performing tab completion
#       * Paging text
#       * Handling ANSI escape codes
#
#   ConsoleWidget also provides a number of utility methods that will be
#   convenient to implementors of a console-style widget.
#------------------------------------------------------------------------------

## The font family to use for the console.
#     On OSX this defaults to Monaco, on Windows the default is
#     Consolas with fallback of Courier, and on other platforms
#     the default is Monospace.
c.ConsoleWidget.font_family = 'Cascadia Mono' if system() == 'Windows' else 'Hack'

## The font size. If unconfigured, Qt will be entrusted with the size of the font.
c.ConsoleWidget.font_size = 14

## The maximum number of lines of text before truncation. Specifying a
#     non-positive number disables text truncation (not recommended).
c.ConsoleWidget.buffer_size = 1_048_576

## The type of underlying text widget to use. Valid values are 'plain', which
#     specifies a QPlainTextEdit, and 'rich', which specifies a QTextEdit.
#  Default: 'plain'
#c.ConsoleWidget.kind = 'rich'

c.JupyterQtConsoleApp.confirm_exit = False
