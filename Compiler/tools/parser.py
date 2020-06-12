import re
from tkinter import filedialog


instructions = {
    'A': {
        'add': ('R', 'R', 'K'),
        'add': ('R', 'R', 'R'),
        'and': ('R', 'R', 'R'),
        'testl': ('R', 'R')
    }, 'I': {
        'ldr': ('R', 'K', 'R'),
        'str': ('R', 'K', 'R')
    }, 'J': {
        'jmp': 'L'
    }
}

instFmt = {'add': 'add Rd, Rf1, K',
           'add': 'add Rd, Rf1, Rf2',
           'and': 'add Rd, Rf1, Rf2',
           'jmp': 'jmp label',
           'ldr': 'ldr Rd, Dd (Rb)',
           'str': 'str Rd, Dd (Rb)'}

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
pattern = pattern + '|([a-z]{2,3}\s*(R([0-9]|1[0-5]))),\s*(R([0-9]|1[0-5]),\s*(R([0-9]|1[0-5])))'
# Instruction I
pattern = pattern + '|([a-z]{2,3}\s*(R([0-9]|1[0-5]))),\s*(([a-z]|[A-Z])+|[0-9]+|0x([0-9]*|[a-f]*|[A-F]*)+)\s*\(R([0-9]|1[0-5])\)'
# Instruction J
pattern = pattern + '|jmp\s*([a-z]|[A-Z]|\_)+'


filename = 'code.asm'
code = ''

with open(filename, 'r') as file:
    code = file.read()
    code = code.split('\n')


def checkInstruction(instruction):
    for instType, inst in instructions.items():
        if instruction in inst:
            return True, instType
    
    return False, ''

def findError(line):
    line = re.split('\s+|,\s*', line)
    
    instruction = line[0]
    found, instructionType = checkInstruction(instruction)
        
    if not found:
        if len(line) == 1 and instruction[-1] != ':':
            return 'Flag must finish with :.'
        return 'Unknown instruction \'' + instruction + '\'.'
    else:
        if len(line) == 1:
            return 'Invalid format. Instruction \'' + instruction +\
                           '\' must be \'' + instFmt[instruction] + '\'.'
        else:
            fmt = instructions[instructionType][instruction]

            for value, reg in zip(line[1:], fmt):
                if reg == 'R' and 'R' not in value:
                    return 'Invalid format. Instruction \'' + instruction +\
                           '\' must be \'' + instFmt[instruction] + '\'.'
                elif reg == 'K' and (value[:1] != '0x' and not value.isnumeric()):
                    return 'Invalid format. Instruction \'' + instruction +\
                           '\' must be \'' + instFmt[instruction] + '\'.'


def validateCode(code, pattern):
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
            else:
                error = findError(codeLine)
                errors.append((lineNumber, codeLine, error))
    return errors, valid

errors, valid = validateCode(code, pattern)


if errors:
    for error in errors:
        print('Error in line {}: {} -> {}'.format(error[0], error[1], error[2]))

