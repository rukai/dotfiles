from ranger.api.commands import *

class renameCommand(Command):
    """:renameCommand

    Creates an open_console for the rename command, automatically placing the cursor before the file extension.
    """

    def execute(self):
        if "." in self.fm.thisfile.basename:
            offset = 6 + len(self.fm.thisfile.basename) - self.fm.thisfile.basename[::-1].index('.')
            self.fm.open_console('rename ' + self.fm.thisfile.basename, position=offset)
        else:
            self.fm.open_console('rename ' + self.fm.thisfile.basename)
