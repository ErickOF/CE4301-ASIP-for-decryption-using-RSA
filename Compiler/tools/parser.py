import re


instructions = {
    'A': {
        'ADD': ('R', 'R', 'K'),
        'ADD': ('R', 'R', 'R'),
        'AND': ('R', 'R', 'R'),
        'testl': ('R', 'R')
    }, 'I': {
        'LDR': ('R', 'K', 'R'),
        'STR': ('R', 'K', 'R')
    }, 'J': {
        'JMP': 'L'
    }
}

instFmt = {'ADD': 'ADD RD, RF1, K',
           'ADD': 'ADD RD, RF1, RF2',
           'AND': 'AND RD, RF1, RF2',
           'JMP': 'JMP LABEL',
           'LDR': 'LDR RD, K (RF1)',
           'STR': 'STR RD, K (RF1)'}

constants = {}

memory = []

# Comments
pattern = ';(.*)'
# Constants section
pattern = pattern + '|.const'
# Constants definition
pattern = pattern + '|([a-z]|[A-Z])+([0-9]*)\s*=\s*((0x(([0-9]|[a-f]|[A-F])+)|([0-9]+)))'
# Text definition
pattern = pattern + '|.text'
# Flags
pattern = pattern + '|([a-z]|[A-Z]|\_)+:'
# Instruction A
pattern = pattern + '|(([A-Z]|[a-z]){2,3}\s*(R([0-9]|1[0-5]))),\s*(R([0-9]|1[0-5]),\s*(R([0-9]|1[0-5])))'
# Instruction I
pattern = pattern + '|(([A-Z]|[a-z]){2,3}\s*(R([0-9]|1[0-5]))),\s*(([a-z]|[A-Z])+|[0-9]+|0x([0-9]*|[a-f]*|[A-F]*)+)\s*\(R([0-9]|1[0-5])\)'
# Instruction J
pattern = pattern + '|JMP\s*([a-z]|[A-Z]|\_)+'


class Parser:
    def __isInstruction(self, instruction: str) -> tuple:
        for instType, inst in instructions.items():
            # Check if instruction exists
            if instruction.upper() in inst:
                return True, instType
        
        return False, ''

    def __findError(self, line: str) -> str:
        # Split instruction
        line = re.split('\s+|\s*,\s*', line)

        # Get instruction o flag name
        instruction = line[0]
        # Check if it's a instruction
        found, instructionType = self.__isInstruction(instruction)

        # If a instruction was not found
        if not found:
            # Check if it's a flag
            if len(line) == 1 and instruction[-1] != ':':
                return 'Flag must finish with :.'
            # It's a unknown instruction
            return 'Unknown instruction \'' + instruction + '\'.'
        # If a instruction was found
        else:
            # If the line only contains the instruction name
            if len(line) == 1:
                return 'Invalid format. Instruction \'' + instruction +\
                        '\' must be \'' + instFmt[instruction.upper()] + '\'.'

            # Get instruction format
            fmt = instructions[instructionType][instruction.upper()]

            for value, reg in zip(line[1:], fmt):
                # Check if it's a Register-Register type
                if reg == 'R' and 'R' not in value:
                    return 'Invalid format. Instruction \'' + instruction +\
                        '\' must be \'' + instFmt[instruction.upper()] + '\'.'
                # Check if it's a Register-Constant type
                elif reg == 'K' and (value[:2] != '0x' and not value.isnumeric()):
                    return 'Invalid format. Instruction \'' + instruction +\
                        '\' must be \'' + instFmt[instruction.upper()] + '\'.'

        # Error was not found
        return "Undefined error."


    def __validateCode(self, code: str, pattern: str):
        errors, valid = [], []

        for lineNumber, codeLine in enumerate(code):
            # If not empty line
            if codeLine:
                # Parse
                parse = re.match(pattern, codeLine)

                # If not error
                if parse:
                    # Found
                    line = parse.group(0)

                    # Print if it s not a comment
                    if line[0] != ';':
                        valid.append(line)
                # Add error
                else:
                    error = self.__findError(codeLine)
                    errors.append((lineNumber, codeLine, error))
        return errors, valid

    def parseCode(self, code: str):
        # Validate code
        wrongLines, validLines = self.__validateCode(code, pattern)

        errors = []
        valid = wrongLines == []

        # Gives format to code
        for line in wrongLines:
            errors.append('Error in line {}: {} -> {}'.format(line[0], line[1], line[2]))
        
        return valid, errors

