# Configuration file for lab.

c = get_config()  #noqa

#------------------------------------------------------------------------------
# Application(SingletonConfigurable) configuration
#------------------------------------------------------------------------------
## This is an application.

# section empty

#------------------------------------------------------------------------------
# ExtensionApp(JupyterApp) configuration
#------------------------------------------------------------------------------
## Base class for configurable Jupyter Server Extension Applications.
#
#      ExtensionApp subclasses can be initialized two ways:
#
#      - Extension is listed as a jpserver_extension, and ServerApp calls
#        its load_jupyter_server_extension classmethod. This is the
#        classic way of loading a server extension.
#
#      - Extension is launched directly by calling its `launch_instance`
#        class method. This method can be set as a entry_point in
#        the extensions setup.py.

## Whether to open in a browser after starting.
#          The specific browser used is platform dependent and
#          determined by the python standard library `webbrowser`
#          module, unless it is overridden using the --browser
#          (ServerApp.browser) configuration option.
#  Default: False
c.ExtensionApp.open_browser = False


#------------------------------------------------------------------------------
# LabServerApp(ExtensionApp) configuration
#------------------------------------------------------------------------------
## A Lab Server Application that runs out-of-the-box

## Whether a notebook should start a kernel automatically.
#  Default: True
c.LabServerApp.notebook_starts_kernel = False

## Whether to open in a browser after starting.
#  See also: ExtensionApp.open_browser
c.LabServerApp.open_browser = False


#------------------------------------------------------------------------------
# LabApp(LabServerApp) configuration
#------------------------------------------------------------------------------

## Whether a notebook should start a kernel automatically.
#  Default: True
c.LabApp.notebook_starts_kernel = False

## Whether to open in a browser after starting.
#  See also: ExtensionApp.open_browser
c.LabApp.open_browser = False

#------------------------------------------------------------------------------
# ServerApp(JupyterApp) configuration
#------------------------------------------------------------------------------
## The Jupyter Server application class.

## Whether to open in a browser after starting.
#                          The specific browser used is platform dependent and
#                          determined by the python standard library `webbrowser`
#                          module, unless it is overridden using the --browser
#                          (ServerApp.browser) configuration option.
#  Default: False
c.ServerApp.open_browser = False




from pathlib import Path
c.FileCheckpoints.checkpoint_dir = str(Path.home() / ".jupyter/checkpoints")
