from PyQt5 import QtWidgets, uic
import sys

from gui.xasm_ide import XAsmIde


if __name__ == '__main__':
    # Run IDE
    app = QtWidgets.QApplication(sys.argv)
    ide = XAsmIde()
    ide.show()
    app.exec_()
