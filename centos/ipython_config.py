# -*- coding: utf-8 -*-
# Import numpy now to set the terminal width. I could use wrapt to delay the
# terminal width setting until it is actually loaded, but that seems more
# complicated than it is worth.
# http://stackoverflow.com/a/40624185/303425

c = get_config()  # noqa

c.InteractiveShell.colors = 'Linux'  # Use dark background color scheme.
c.TerminalIPythonApp.display_banner = False
c.TerminalInteractiveShell.confirm_exit = False
c.TerminalInteractiveShell.term_title = True

# Enable 'aimport foo' to turn on autoreloading of module 'foo'.
c.TerminalIPythonApp.extensions = ['autoreload']
c.InteractiveShellApp.exec_lines = ['autoreload 2']

# IPython's default readline config remaps the cursor keys to do history
# searches, which is extremely annoying.  By setting this here, we prevent *all*
# of the default mappings, the only of which we care about is tab completion.
# c.TerminalInteractiveShell.readline_parse_and_bind = ['tab: complete', ]

# Make the IPython prompt look like the regular Python one.
try:
    from IPython.terminal.prompts import Prompts, Token
except ImportError:
    c.PromptManager.in_template = '>>> '
    c.PromptManager.in2_template = '... '
    c.PromptManager.out_template = ''
    c.PromptManager.justify = False
else:

    class BasicPythonPrompt(Prompts):
        """Emulates the regular python interactive prompt."""

        def in_prompt_tokens(self, cli=None):
            return [(Token.Prompt, 'In :')]

        def continuation_prompt_tokens(self, cli=None, width=None):
            return [(Token.Prompt, '... ')]

        def out_prompt_tokens(self, cli=None):
            return [(Token.OutPrompt, 'Out:')]

    c.TerminalInteractiveShell.prompts_class = BasicPythonPrompt

# Set up aliases for shell commands.
c.AliasManager.user_aliases = [('git', 'git')]
c.StoreMagics.autorestore = True
