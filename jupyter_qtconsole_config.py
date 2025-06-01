# Configuration file for qtconsole.

from platform import system

c = get_config()  #noqa

c.ConsoleWidget.font_family = 'Cascadia Mono'  if system() == 'Windows' else 'Hack'
c.ConsoleWidget.font_size = 14

#c.ConsoleWidget.kind = 'rich'

c.JupyterQtConsoleApp.confirm_exit = False
