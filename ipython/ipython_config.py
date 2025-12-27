
c = get_config()
c.TerminalInteractiveShell.editing_mode = 'vi'
# 4. Colored output for readability
c.TerminalInteractiveShell.colors = 'Linux'
c.InteractiveShellApp.exec_lines.append('import matplotlib.pyplot as plt; plt.ion()')
c.InteractiveShellApp.exec_lines = [
    'print("AVE CAESAR! Welcome to IPython, citizen of Rome!")',
    'print("Veni, Vidi, Vici")',
 ]
c.TerminalInteractiveShell.prompts_class = 'IPython.terminal.prompts.Prompts'

from IPython.terminal.prompts import Prompts, Token

class RomanPrompts(Prompts):
    def in_prompt_tokens(self, cli=None):
        # Add SPQR prefix, emoji, and keep the input number
        return [(Token.Prompt, f'SPQR [{self.shell.execution_count}]> ')]
    
    def out_prompt_tokens(self):
        # Keep output numbering with a Roman flavor
        return [(Token.OutPrompt, f'ROMA [{self.shell.execution_count}]> ')]
#         return [(Token.OutPrompt, f'🏛️ROMA [{self.shell.execution_count}]> ')]

c.TerminalInteractiveShell.prompts_class = RomanPrompts

