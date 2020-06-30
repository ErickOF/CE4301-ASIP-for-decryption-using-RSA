class InstructionMemory:
    __instance = None

    def __init__(self):
        """Virtually private constructor."""
        if InstructionMemory.__instance != None:
            raise Exception("This class is a singleton!")
        else:
            self.__address = 0
            self.__instructions = {}
            InstructionMemory.__instance = self

    @staticmethod 
    def getInstance():
        if InstructionMemory.__instance == None:
            InstructionMemory()

        return InstructionMemory.__instance

    def addInstruction(self, instr: str, value: str):
        cell = {'instruction': instr, 'value': value}
        self.__instruction[hex(self.__address)] = cell
        self.__address += 4

    def getInstruction(self, address):
        return self.__address
    
    def clear(self):
        for address in self.__instructions:
            self.__instructions[address] = 0
        
        self.__address = 0

class DataMemory:
    __instance = None

    def __init__(self, size=5000):
        """Virtually private constructor."""
        if DataMemory.__instance != None:
            raise Exception("This class is a singleton!")
        else:
            self.__size = size
            self.__memory = {}
            self.__fillMemory()
            DataMemory.__instance = self

    @staticmethod 
    def getInstance(size=5000):
        if DataMemory.__instance == None:
            DataMemory(size)

        return DataMemory.__instance

    def __fillMemory(self):
        for i in range(0, self.__size, 4):
            self.__memory[hex(i)] = 0

    def setValue(self, address: str, value):
        self.__memory[address] = value

    def getValue(self, address: str) -> int:
        return self.__memory[address]

    def clear(self):
        self.__fillMemory()

