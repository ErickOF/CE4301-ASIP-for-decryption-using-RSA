from tools.memory import DataMemory

import re


# +- 2**31
MAX_INT_VALUE = 2147483648
MIN_INT_VALUE = -2147483648

# Valid instructions
instructions = {
    'RR': {
        'ADD': ('R', 'R', 'R'),
        'AND': ('R', 'R', 'R'),
    }, 'RC': {
        'ADD': ('R', 'R', 'K'),
        'AND': ('R', 'R', 'K'),
    }, 'LS': {
        'LDB': ('R', 'K', 'R'),
        'LDW': ('R', 'K', 'R'),
        'LDR': ('R', 'K', 'R'),
        'STB': ('R', 'K', 'R'),
        'STW': ('R', 'K', 'R'),
        'STR': ('R', 'K', 'R')
    }, 'J': {
        'JMP': 'L'
    }
}

# Instructions Format
instFmt = {
    'ADD': 'ADD RD, RF1, RF2 or ADD RD, RF1, K',
    'AND': 'AND RD, RF1, RF2 or AND RD, RF1, K',
    'LDB': 'LDB RD, K (RF1)',
    'LDW': 'LDW RD, K (RF1)',
    'LDR': 'LDR RD, K (RF1)',
    'STB': 'STB RD, K (RF1)',
    'STW': 'STW RD, K (RF1)',
    'STR': 'STR RD, K (RF1)',
    'JMP': 'JMP LABEL'
}

# Regular Expression
comment_re = ';(.*)'
constants_section_re = '.const'
text_section_re = '.text'
alphabet_re = '([a-z]|[A-Z])'
numbers_re = '[0-9]'
var_name_re = f'({alphabet_re}({alphabet_re}|{numbers_re}|\_)*)'
hex_chars_re = f'({numbers_re}|[a-f]|[A-F])'
hex_values_re = f'(0x{hex_chars_re}+|{hex_chars_re}+(h|H))'
bin_values_re = '(0b[0-1]+|[0-1]+(b|B))'
dec_values_re = f'([1-9]{numbers_re}*)'
register_re = f'R({numbers_re}|(1|2){numbers_re}|3[0-1])'
numeric_re = f'({hex_values_re}|{bin_values_re}|{dec_values_re})'
constants_def_re = f'({var_name_re}\s*=\s*{numeric_re})'
flags_re = f'({var_name_re}+:)'
# Instruction name
instruction_re = f'{alphabet_re}' + '{2,3}'
# Register-Register Type Instructions
inst_rr_re = f'({instruction_re}\s*{register_re},\s*{register_re},\s*{register_re})'
# Register-Constant Type Instructions
inst_rc_re = f'({instruction_re}\s*{register_re},\s*{register_re},\s*{numeric_re})'
# Load/Store Type Instructions
inst_ls_re = f'({instruction_re}\s*{register_re},\s*({numeric_re}|{var_name_re})\s*\({register_re}\))'
# Jump Instructions
inst_jmp_re = f'J(MP|EQ|NE|GT|GE|LT|LE)\s+{var_name_re}'

# Patterns
# Comments
pattern = comment_re
# Constants section
pattern += f'|{constants_section_re}'
# Constants definition
pattern += f'|{constants_def_re}'
# Text definition
pattern += f'|{text_section_re}'
# Flags
pattern += f'|{flags_re}'
# Register-Register Type Instructions
pattern += f'|{inst_rr_re}'
# Register-Constant Type Instructions
pattern += f'|{inst_rc_re}'
# Load/Store Type Instructions
pattern += f'|{inst_ls_re}'
# Jump Instructions
pattern += f'|{inst_jmp_re}'

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
        return 'Undefined error.'


    def __validateCode(self, code: str, pattern: str):
        errors, validLine, validConstants = [], [], []

        _type = ''
        constants = {}

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

                                # Check min value
                                if MIN_INT_VALUE < value < MAX_INT_VALUE:
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
            data['lines'] = validLines
            data['constants'] = validConstants

        return valid, data

