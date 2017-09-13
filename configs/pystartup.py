"""Customize prompts and use REPL history persistence."""
import atexit
import os
import readline
import sys

ANSI_COLOR_CODES = {
    'black': 30,
    'red': 31,
    'green': 32,
    'yellow': 33,
    'blue': 34,
    'purple': 35,
    'cyan': 36,
    'white': 37,
    'default': 39,
}

ANSI_STYLE_CODES = {
    'bold': 1,
    'bright': 1,
    'dim': 2,
    'underline': 4,
    'invert': 7,
    'reverse': 7,
}


def colorize_ansi(text, color='default', styles=(), bright=False):
    """Colorize and stylize string using ANSI escape codes."""
    mods = []
    for style in styles:
        if style in ANSI_STYLE_CODES:
            mods.append(ANSI_STYLE_CODES[style])
    if len(mods) == 0:
        mods = {0}
    else:
        mods = set(mods)
    color = ANSI_COLOR_CODES.get(color, 39)
    if bright:
        color += 60
    modstr = ';'.join((str(m) for m in mods))
    return '\001\033[{};{}m\002{}\001\033[00m\002'.format(modstr, color, text)


def setup_history():
    """Read history and register to save at exit."""
    histfile = os.path.join(os.path.expanduser('~'),
                            '.python_history{}'.format(sys.version[0]))
    try:
        readline.read_history_file(histfile)
        h_len = readline.get_current_history_length()
    except IOError:
        open(histfile, 'wb').close()
        h_len = 0

    def save(prev_h_len, histfile):
        new_h_len = readline.get_current_history_length()
        readline.set_history_length(10000)
        try:
            readline.append_history_file(new_h_len - h_len, histfile)
        except AttributeError:
            # python2, pypy, and pypy3 have no `append_history_file` method.
            # These older versions of Python truncate and rewrite the file.
            # This means that if you have multiple REPL sessions open, they
            # will overwrite each others' history file. :(
            readline.write_history_file(histfile)
    atexit.register(save, h_len, histfile)


def setup_prompts():
    """Give the default REPL prompts some color."""
    sys.ps1 = colorize_ansi('>>> ', 'blue', {'bold'}, True)
    sys.ps2 = colorize_ansi('... ', 'cyan')


if __name__ == '__main__':
    setup_prompts()
    setup_history()
