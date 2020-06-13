class Compiler:
    def compileConstants(self, constLines: list):
        consts = {}

        for i, line in enumerate(constLines):
            var, value = line.split(' = ')

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

            consts[hex(i * 4)] = [var, int(value, base=base)]
        
        return consts
