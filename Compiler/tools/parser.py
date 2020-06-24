from tools.memory import DataMemory

import re


# 2**12
MAX_INT_VALUE = 4096
MIN_INT_VALUE = 0

# Mult code RD = RA x RB
# NUM -> number of multiplication
# RD -> Destination Register
# RA -> Source Register 1
# RB -> Source Register 2 or Constant
MULT_CODE="""MULT_FLAG_XASM_COMPILER_NUM:
SUB RD, RD, RD
MULT_FLAG_XASM_COMPILER_NUM_LOOP:
ADD RD, RD, RB
SUB RD, RD, 0x01
CMP RA, 0x0
JNE MULT_FLAG_XASM_COMPILER_NUM_LOOP
"""

# Valid instructions
instructions = {
    'RR': {
        'ADD': ('R', 'R', 'R'),
        'SUB': ('R', 'R', 'R'),
        'MUL': ('R', 'R', 'R'),
        'DIV': ('R', 'R', 'R'),
        'CMP': ('R', 'R')
    }, 'RK': {
        'ADD': ('R', 'R', 'K'),
        'SUB': ('R', 'R', 'K'),
        'MUL': ('R', 'R', 'K'),
        'DIV': ('R', 'R', 'K'),
        'CMP': ('R', 'K')
    }, 'LS': {
        'LDR': ('R', 'K', 'R'),
        'STR': ('R', 'K', 'R')
    }, 'J': {
        'JEQ': 'L',
        'JNE': 'L',
        'JMP': 'L'
    }
}

# Instructions Format
instFmt = {
    'ADD': 'ADD RD, RA, RB or ADD RD, RA, K',
    'SUB': 'SUB RD, RA, RB or SUB RD, RA, K',
    'MUL': 'MUL RD, RA, RB or MUL RD, RA, K',
    'DIV': 'DIV RD, RA, RB or DIV RD, RA, K',
    'CMP': 'CMP RD, RA or CMP RD, K',
    'LDR': 'LDR RD, K (RA)',
    'STR': 'STR RD, K (RA)',
    'JEQ': 'JEQ LABEL',
    'NE': 'NE LABEL',
    'JMP': 'JMP LABEL',
    'INC': 'INC RS',
    'DEC': 'DEC RS'
}


# Regular Expression
commentRe = ';(.*)'
constantsSectionRe = '.const'
textSectionRe = '.text'
alphabetRe = '([a-z]|[A-Z])'
numbersRe = '[0-9]'
varNameRe = f'({alphabetRe}({alphabetRe}|{numbersRe}|\_)*)'
hexCharsRe = f'({numbersRe}|[a-f]|[A-F])'
hexValuesRe = f'(0x{hexCharsRe}+|{hexCharsRe}+(h|H))'
binValuesRe = '(0b[0-1]+|[0-1]+(b|B))'
decValuesRe = f'([1-9]{numbersRe}*)'
registerRe = f'R({numbersRe}|(1|2){numbersRe}|3[0-1])'
numericRe = f'({hexValuesRe}|{binValuesRe}|{decValuesRe})'
constantsDefRe = f'({varNameRe}\s*=\s*{numericRe})'
flagsRe = f'({varNameRe}+:)'
# Instruction name
instructionRe = f'{alphabetRe}' + '{2,3}'
# Register-Register Type Instructions
instRRRe = f'({instructionRe}\s*{registerRe},\s*{registerRe},\s*{registerRe})'
# CMP instruction
instCMP = f'(CMP\s*{registerRe},\s*({registerRe}|{numericRe}))'
# Register-Constant Type Instructions
instRKRe = f'({instructionRe}\s*{registerRe},\s*{registerRe},\s*{numericRe})'
# Load/Store Type Instructions
instLSRe = f'({instructionRe}\s*{registerRe},\s*({numericRe}|{varNameRe})\s*\({registerRe}\))'
# Jump Instructions
instJmpRe = f'J(MP|EQ|NE)\s+{varNameRe}'

# Patterns
# Comments
pattern = commentRe
# Constants section
pattern += f'|{constantsSectionRe}'
# Constants definition
pattern += f'|{constantsDefRe}'
# Text definition
pattern += f'|{textSectionRe}'
# Flags
pattern += f'|{flagsRe}'
# Register-Register Type Instructions
pattern += f'|{instRRRe}'
# Register-Constant Type Instructions
pattern += f'|{instRKRe}'
# Compare instruction
pattern += f'|{instCMP}'
# Load/Store Type Instructions
pattern += f'|{instLSRe}'
# Jump Instructions
pattern += f'|{instJmpRe}'


class Parser:
    def __isInstruction(self, instruction: str) -> tuple:
        for instType, inst in instructions.items():
            # Check if instruction exists
            if instruction.upper() in inst:
                return True, instType
        
        return False, ''

    def __findCodeError(self, line: str) -> str:
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
            if len(line) < 3 and line[0] != 'CMP':
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
        return 'Undefined error.'

    def __validateCode(self, code: str, pattern: str):
        errors, validLine, validConstants = [], [], []

        _type = ''
        constants = {}
        flags = []

        for lineNumber, codeLine in enumerate(code):
            # If not empty line
            if codeLine:
                # Remove repeated spaces
                codeLine = ' '.join(codeLine.split())
                # Parse
                parse = re.match(pattern, codeLine)

                # If not error
                if parse:
                    # Found
                    line = parse.group(0)

                    # Check section
                    if '.const' in line:
                        _type = '.const'
                    elif '.text' in line:
                        _type = '.text'

                    # If it s not a comment
                    elif line[0] != ';':
                        if _type == '.const':
                            # Get var name and constant value
                            var, value = line.split(' = ')

                            # If constant exists, send a error message
                            if var in constants:
                                errors.append((lineNumber, codeLine, 'Constant already exists.'))
                            else:
                                base = 10

                                # If value is in hex convert it in dec
                                if value[:2] == '0x':
                                    base=16
                                    value = value[2:]
                                elif value[-1] in 'hH':
                                    base=16
                                    value = value[:-1]
                                # If value is in bin convert it in dec
                                elif value[:2] == '0b':
                                    base=2
                                    value = value[2:]
                                elif value[-1] in 'bB':
                                    base=2
                                    value = value[:-1]
                                
                                value = int(value, base=base)

                                # Check min value and max value
                                if MIN_INT_VALUE <= value < MAX_INT_VALUE:
                                    constants[var] = value
                                    validConstants.append(line)
                                elif base == 0:
                                    errors.append((lineNumber, codeLine,
                                        'Max value should be between ' +\
                                        f'{MIN_INT_VALUE} and {MAX_INT_VALUE}.'))
                                else:
                                    convert = hex if base == 16 else bin
                                    errors.append((lineNumber, codeLine,
                                        'Max value should be between ' +\
                                        f'{convert(MIN_INT_VALUE)} and ' +\
                                        f'{convert(MAX_INT_VALUE)}.'))
                        else:
                            # if it's a flag, add to flags
                            if line[-1] == ':':
                                flags.append(line[:-1].upper())
                                validLine.append(line)
                            # Check if it's a jump instuction
                            elif line[0].upper() == 'J':
                                flag = line.split(' ')[-1]

                                # Check if flag exists
                                if flag.upper() in flags:
                                    validLine.append(line)
                                else:
                                    errors.append((lineNumber, codeLine,
                                        f'Flag {flag} does not exist.'))
                            elif line[:3].upper() == 'CMP':
                                validLine.append(line)
                            # Other instructions are valid
                            else:
                                # Check if it's a instruction
                                found, instructionType = self.__isInstruction(line[:3])

                                # If instruction was found and it's Register-
                                # Constant or Load-Store
                                if found and instructionType in ['RK', 'LS']:
                                    # Replace constants values in code line
                                    done, line = self.__replaceConstants(line,
                                                            instructionType,
                                                            constants)

                                    # It was done, add to valid line
                                    if done:
                                        validLine.append(line)
                                    # Add an error
                                    else:
                                        errors.append((lineNumber, codeLine,
                                            f'Constant {line} does not exist.'))
                                # If not found, only add value
                                else:
                                    validLine.append(line)
                # Add error
                else:
                    if _type == '.const':
                        errors.append((lineNumber, codeLine,
                                       'Unvalid constant value.'))
                    elif _type == '.text':
                        error = self.__findCodeError(codeLine)
                        errors.append((lineNumber, codeLine, error))

        return errors, validLine, validConstants

    def __replaceConstants(self, line, instructionType, constants):
        # Split instruction
        instr, reg, value1, value2 = line.split(' ')

        # If it's a Register-Constant instruction
        if instructionType == 'RK':
            # Constant value must be value2
            if value2 in constants:
                return True, f'{instr} {reg} {value1} {constants[value2]}'
            # If it's hex value
            elif (value2[-1] in 'Hh' and value2[:-1]) or ('0x' == value2[:2] and value2[2:]):
                return True, f'{instr} {reg} {value1} {int(value2, 16)}'
            # If it's bin value
            elif (value2[-1] in 'Bb' and value2[:-1]) or ('0b' == value2[:2] and value2[2:]):
                return True, line
            # If it's dec value
            elif value2.isnumeric():
                return True, line
            else:
                return False, value2
        # If it's a Load-Store instruction
        else:
            # Constant value must be value1
            if value1 in constants:
                return True, f'{instr} {reg} {constants[value1]} {value2}'
            # If it's hex value
            elif (value2[-1] in 'Hh' and value2[:-1]) or ('0x' == value2[:2] and value2[2:]):
                return True, line
            # If it's bin value
            elif (value2[-1] in 'Bb' and value2[:-1]) or ('0b' == value2[:2] and value2[2:]):
                return True, line
            # If it's dec value
            elif value1.isnumeric():
                return True, line
            else:
                return False, value1
    
    def __flagsToAddresses(self, lines: list) -> list:
        address = 0
        flagsAddress = {}
        outputLines = []

        for line in lines:
            # If line is a flag, convert to an address
            if line[-1] == ':':
                flagsAddress[line[:-1].upper()] = address
            # If line is a jump instruction
            elif line[0].upper() == 'J':
                # Replace flag by address
                instr, flag = line.split(' ')
                outputLines.append(f'{instr} {hex(flagsAddress[flag.upper()])}')
                address += 4
            else:
                outputLines.append(line)
                address += 4
        
        return outputLines
    
    def __splitInstructions(self, instructions):
        output = []

        for instruction in instructions:
            if instruction[:3] != 'CMP':
                _, instrType = self.__isInstruction(instruction[:3])

                # Register Register
                if instrType == 'RR':
                    instr, rd, ra, rb = instruction.split(' ')

                    # Register Constant
                    if rb.isnumeric() or rb[-1] in 'hHbB' or rb[:2] in '0x0b':
                        output.append({'I': instr, 'RD': rd[:-1], 'RA': ra[:-1],
                                    'K': rb, 'type': 'RK'})
                    # Register Register
                    else:
                        output.append({'I': instr, 'RD': rd[:-1], 'RA': ra[:-1],
                                    'RB': rb, 'type': 'RR'})
                # Register Constant
                elif instrType == 'LS':
                    instr, rd, k, ra = instruction.split(' ')
                    output.append({'I': instr, 'RD': rd[:-1], 'RA': ra[1:-1],
                                'K': k, 'type': 'LS'})
                # Jump
                else:
                    instr, flag = instruction.split(' ')
                    output.append({'I': instr, 'flag': flag, 'type': 'J'})
            else:
                instr, rd, value = instruction.split(' ')

                # Register Constant
                if value.isnumeric() or value[-1] in 'hHbB' or value[:2] in '0x0b':
                    output.append({'I': instr, 'RD': rd[:-1], 'K': value,
                                   'RA': '00', 'type': 'RK'})
                # Register Register
                else:
                    output.append({'I': instr, 'RD': rd[:-1], 'RA': value,
                                   'RB': '00', 'type': 'RR'})

        return output

    def parseCode(self, code: str):
        # Validate code
        wrongLines, validLines, validConstants = self.__validateCode(code, pattern)

        errors = []
        valid = wrongLines == []
        data = {}

        # Gives format to code
        for line in wrongLines:
            errors.append('Error in line {}: {} -> {}'.format(line[0], line[1], line[2]))

        data['errors'] = errors

        if wrongLines == []:
            validLines = self.__flagsToAddresses(validLines)
            data['lines'] = validLines
            data['split'] = self.__splitInstructions(validLines)

            with open('tools/.temp/parse.txt', 'w') as file:
                file.write("\n".join(validLines))

        return valid, data

