# Operation code
op = {
    'ADD': '000',
    'SUB': '000',
    'CMP': '001',
    'LDR': '010',
    'STR': '011',
    'JEQ': '100',
    'JNE': '101',
    'JMP': '110',
    'NOP': '111'
}

# Functions
functions = {
    'RR': {
        'ADD': '00',
        'SUB': '10',
        'CMP': '00'
    },
    'RK': {
        'ADD': '01',
        'SUB': '11',
        'CMP': '01'
    }
}

class Compiler:
    def __compileInstruction(self, instruction):
        if instruction['type'] == 'RR':
            opCode = op[instruction['I']]
            rd = bin(int(instruction['RD'][1:]))[2:]
            ra = bin(int(instruction['RA'][1:]))[2:]
            rb = bin(int(instruction['RB'][1:]))[2:]
            k = '0'*12

            return f'{opCode}-{"0"*(5 - len(rd)) + rd}-{"0"*(5 - len(ra)) + ra}-' +\
                   f'{"0"*(5 - len(rb)) + rb}-{k}-{functions["RR"][instruction["I"]]}'
        elif instruction['type'] == 'RK':
            opCode = op[instruction['I']]
            rd = bin(int(instruction['RD'][1:]))[2:]
            ra = bin(int(instruction['RA'][1:]))[2:]
            rb = '0'*5
            k = instruction['K']

            if k[:2] == '0x':
                k = bin(int(instruction['K'], 16))[2:]
            elif k[:2] in '0b0B':
                k = k[2:].lower()
            elif k[-1] in 'Hh':
                k = bin(int(instruction['K'][:2]))[2:]
            elif k[-1] in 'Bb':
                k = k[:-1]
            else:
                k = bin(int(instruction['K']))[2:]

            return f'{opCode}-{("0"*(5 - len(rd)) + rd)}-{"0"*(5 - len(ra)) + ra}-' +\
                   f'{rb}-{"0"*(12 - len(k)) + k}-{functions["RK"][instruction["I"]]}'
        elif instruction['type'] == 'LS':
            opCode = op[instruction['I']]
            rd = bin(int(instruction['RD'][1:]))[2:]
            ra = bin(int(instruction['RA'][1:]))[2:]
            k = instruction['K']

            if k[:2] == '0x':
                k = bin(int(instruction['K'][2:], 16))[2:]
            elif k[:2] in '0b0B':
                k = k[2:].lower()
            elif k[-1] in 'Hh':
                k = bin(int(instruction['K'][:-1]))[2:]
            elif k[-1] in 'Bb':
                k = k[:-1]
            else:
                k = bin(int(instruction['K']))[2:]

            return f'{opCode}-{("0"*(5 - len(rd)) + rd)}-{"0"*(5 - len(ra)) + ra}-' +\
                   f'{"0"*(19 - len(k)) + k}'
        else:
            opCode = op[instruction['I']]
            flag = bin(int(instruction['flag'], 16))[2:]

            return f'{opCode}-{("0"*(29 - len(flag)) + flag)}'

    def compile(self, lines: list):
        output = []
        dump = []

        for line in lines:
            compiledLine = self.__compileInstruction(line)
            dump.append(compiledLine)
            hexLine = hex(int(compiledLine.replace('-', ''), 2))[2:].upper()
            hexLine = (8 - len(hexLine))*'0' + hexLine

            compiledInstr = ''

            for i in range(0, 8, 2):
                compiledInstr += hexLine[i:i+2] + ' '

            output.append(compiledInstr[:-1])

        with open('tools/.temp/compile.txt', 'w') as file:
            file.write("\n".join(output))
        
        with open('tools/.temp/dump.txt', 'w') as file:
            file.write("\n".join(dump))

        return output
