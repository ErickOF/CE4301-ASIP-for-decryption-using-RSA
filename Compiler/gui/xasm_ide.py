from PyQt5 import QtWidgets, uic
from PyQt5.QtWidgets import QAction, QFileDialog, QMainWindow, QMessageBox
from PyQt5.QtWidgets import QPlainTextEdit, QPushButton, QTableWidget
from PyQt5.QtWidgets import QTableWidgetItem
from threading import Thread

from tools.registers import RegisterSet
from tools.xasm_file import XAsmFile


class XAsmIde(QMainWindow):
    """X-Assambler Ide class
    """
    def __init__(self):
        super(XAsmIde, self).__init__()
        self.__running = True
        self.__title = 'XAsm Editor v0.0.1'
        self.__file = XAsmFile()

        # Call the inherited classes __init__ method
        super(XAsmIde, self).__init__()
        # Load the .ui file
        uic.loadUi('./gui/xasm_ide.ui', self)

        # Components
        # Registers table
        self.__tableRegisters = self.findChild(QTableWidget, 'tableRegisters')
        # 32 registers
        registers = RegisterSet(32)
        self.__setRegistersValue(registers.getRegisters())

        # Code editor
        self.__codeEditor = self.findChild(QPlainTextEdit, 'codeEditor')
        self.__codeEditorThread = Thread(target=self.__setUnsavedFile)
        self.__codeEditorThread.start()

        # Actions
        self.__initActions()

        # New file
        self.__createFile()

    def __setUnsavedFile(self):
        while self.__running:
            if self.__file.getContent() != self.__codeEditor.toPlainText():
                # Mark file as unsaved
                self.__file.setContent(self.__codeEditor.toPlainText())
                self.__file.setUnsaved()

                # Set unsaved in window title
                self.setWindowTitle('*' + self.__title)

    def __setRegistersValue(self, registers: RegisterSet) -> None:
        for i, register in enumerate(registers):
            # Register value is stored in decimal
            registerValue = register.getValue()

            # Set values into the table
            self.__tableRegisters.setItem(i, 0,
                QTableWidgetItem(register.getName()))
            self.__tableRegisters.setItem(i, 1,
                QTableWidgetItem(str(registerValue)))
            self.__tableRegisters.setItem(i, 2,
                QTableWidgetItem(hex(registerValue)))
            self.__tableRegisters.setItem(i, 3,
                QTableWidgetItem(bin(registerValue)))

    def __initActions(self) -> None:
        # New File
        actionNewFile = self.findChild(QAction, 'actionNew_File')
        actionNewFile.setStatusTip('New XASM file')
        actionNewFile.triggered.connect(self.__onNewFileClick)

        # Open File
        actionNewFile = self.findChild(QAction,'actionOpen')
        actionNewFile.setStatusTip('Open a XASM file')
        actionNewFile.triggered.connect(self.__onOpenFileClick)

        # Save File
        actionNewFile = self.findChild(QAction,'actionSave')
        actionNewFile.setStatusTip('Save file')
        actionNewFile.triggered.connect(self.__onSaveClick)

        # Save File As
        actionNewFile = self.findChild(QAction, 'actionSave_As')
        actionNewFile.setStatusTip('Save file as')
        actionNewFile.triggered.connect(self.__onSaveAsClick)
    
    def __onNewFileClick(self) -> None:
        # Check if file exists o was saved
        if not self.__file.isSaved():
            response = self.__showSaveDialog('Unsaved file', 'Would you like to save your file?')

            # Save file
            if response == 0:
                self.__onSaveClick()
                self.__createFile()
            # Don't save file
            elif response == 1:
                self.__createFile()
        else:
            self.__createFile()
    
    def __createFile(self):
        # Create new file
        self.__file = XAsmFile()
        # Set code editor as Empty
        self.__codeEditor.setPlainText('')
        # Set window title
        self.setWindowTitle(self.__title)

    def __openFile(self) -> None:
        # Get file path
        filename = QFileDialog.getOpenFileName(self, 'Open file', '',
                                    'XAsm files (*.asm *.s *.xasm )')
        
        # Check if path was gotten
        if filename[0]:
            # Get path
            filepath = filename[0]

            # Set image text in text edit
            with open(filepath) as file:
                # Read file content
                content = file.read()
                # Create the new file
                self.__file = XAsmFile(filepath, content)
                # Set file content in code editor
                self.__codeEditor.setPlainText(content)
                self.__file.save()
                # Set new window title
                self.setWindowTitle(self.__title)

    def __onOpenFileClick(self) -> None:
        # Check if file exists o was saved
        if not self.__file.isSaved():
            response = self.__showSaveDialog('Unsaved file', 'Would you like to save your file?')

            # Save file
            if response == 0:
                self.__onSaveClick()
                # Open the new file
                self.__openFile()
            # Don't save file
            elif response == 1:
                # Open the new file
                self.__openFile()
        else:
            # Open the new file
            self.__openFile()
    
    def __onSaveClick(self):
        # Check if file has path
        if self.__file.getPath():
            # Save
            self.__file.save()
            self.setWindowTitle(self.__title + '-')
        else:
            # As for path
            self.__onSaveAsClick()
    
    def __onSaveAsClick(self):
        # Get file path
        filename = QFileDialog.getSaveFileName(self, 'Save file', '',
                                            'XAsm files (*.asm *.s *.xasm )')

        # Check if path was gotten
        if filename[0]:
            # Get path
            filepath = filename[0]
            self.__file.setPath(filepath)
            self.__file.save()
            self.setWindowTitle(self.__title)

    def __showSaveDialog(self, title: str, msg: str) -> str:
        # Message Box
        msgBox = QMessageBox()
        # Icon, message and tittle
        msgBox.setIcon(QMessageBox.Warning)
        msgBox.setText(msg)
        msgBox.setWindowTitle(title)
        # Buttons
        msgBox.addButton(QPushButton('Save'), QMessageBox.YesRole)
        msgBox.addButton(QPushButton('Don\'t save'), QMessageBox.NoRole)
        msgBox.addButton(QPushButton('Cancel'), QMessageBox.RejectRole)

        # Waits by user answer and returns it
        return msgBox.exec_()


    def closeEvent(self, event):
        self.__running = False
        event.accept()
