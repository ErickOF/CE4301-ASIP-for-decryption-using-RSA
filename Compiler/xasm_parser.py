import re


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
           'ldr': 'ld Rd, Dd (Rb)',
           'str': 'st Rd, Dd (Rb)'}

constants = {}

memory = []

# Comments
pattern = ';(.*)'
# Program Name
pattern = pattern + '|.program(\s)+(.)+'
# Constants section
pattern = pattern + '|.const'
# Constants definition
pattern = pattern + '|([a-z]|[A-Z])*\s*=\s*(([0-9]+)|(0x(([0-9]*|[a-f]*|[A-F]*)+)))'
# Text definition
pattern = pattern + '|.text'
# Flags
pattern = pattern + '|([a-z]*|[A-Z]*|\_*)+:*'
# Instruction A
pattern = pattern + '|([a-z]{2,3}\s+(R([0-9]|1[0-5]))),\s*(R([0-9]|1[0-5]),\s*(R([0-9]|1[0-5])))'
# Instruction I
pattern = pattern + '|([a-z]{2,3}\s+(R([0-9]|1[0-5]))),\s*(([a-z]|[A-Z])+|[0-9]+|0x([0-9]*|[a-f]*|[A-F]*)+)\s*\(R([0-9]|1[0-5])\)'
# Instruction J
pattern = pattern + '|jmp\s*([a-z]*|[A-Z]*|\_*)+'

code = '''.program Primerejemplo
;-------------------------------------------
; Programa para ilustrar una entrada posible
; ------------------------------------------
.const
num    =    29
num2   =   400
cadena = 0x230
a      = 28
b      = 0x2C3

.text
ciclo_infinito
ld
ld      R1, a (R0); Carga el puntero inicial
ld      R2, b (R1)
ld      R3, 32 (R2); Carga el valor verdadero
add     R4, 2, R2
and     R4, R4, R2
andi    R4, R4, 29
jmp ciclo_infinito
st      R4, a (R0)'''

code = code.split('\n')


def findError(line):
    line = re.split('\s+|,\s*', line)
    
    found = False
    instructionType = ''
    instruction = line[0]

    for instType, inst in instructions.items():
        if instruction in inst:
            found = True
            instructionType = instType
            break
        
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

