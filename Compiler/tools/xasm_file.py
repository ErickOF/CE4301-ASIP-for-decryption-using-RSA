from os import path


class XAsmFile:
    """Class used to manage xasm files
    """
    def __init__(self, path='', content='') -> None:
        """Constructor

        Params
        ---------------------------------------------------------------
            path: str
                File path. Empty string for new files.
            content:
                File content. Empty string for new files.
        """
        self.__path = path
        self.__content = content
        self.__saved = path == ''
    
    def save(self) -> None:
        """Saves the file with the current content.
        """
        with open(self.__path, 'w') as file:
            file.write(self.__content)
            self.__saved = True

    def isSaved(self) -> bool:
        """This method is used to check if the file is saved.

        Returns
        ---------------------------------------------------------------
            True if file is saved, False otherwise.
        """
        return self.__saved

    def setUnsaved(self) -> None:
        """This method set the file as unsaved.
        """
        self.__saved = False
    
    def setContent(self, content: str) -> None:
        """This method set the file content.

        Params
        ---------------------------------------------------------------
            content: str
                New file content.
        """
        self.__content = content

    def getContent(self) -> str:
        """This method returns file content.

        Returns
        ---------------------------------------------------------------
            File content.
        """
        return self.__content
    
    def setPath(self, path: str) -> None:
        """This method set the file path.

        Params
        ---------------------------------------------------------------
            path: str
                New file path.
        """
        self.__path = path

    def getPath(self) -> str:
        """This method returns file path.

        Returns
        ---------------------------------------------------------------
            File path.
        """
        return self.__path

