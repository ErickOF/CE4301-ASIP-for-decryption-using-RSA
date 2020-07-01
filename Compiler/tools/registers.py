class Register:
    def __init__(self, name, value=0):
        self.__name = name
        self.__value = value
    
    def getName(self):
        return self.__name
    
    def getValue(self):
        return self.__value
    
    def getByte(self):
        return int(bin(self.__value)[:8])
    
    def getWord(self):
        return int(bin(self.__value)[:16])

class RegisterSet:
    def __init__(self, number=32):
        self.__number = number
        self.__registers = []
        self.__createRegisters()

    def __createRegisters(self):
        for i in range(self.__number):
            self.__registers.append(Register('R' + str(i)))

    def getRegisters(self):
        return self.__registers
