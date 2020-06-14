# Algoritmo general de la exponenciacion modular
def exp_mod(base, exp, mod):
    if mod == 1:
        return 0

    c = 1
    for _ in range(exp):
        c = (c * base) % mod

    return c

#print(exp_mod(3,  5, 14))
#print(exp_mod(5, 11, 14))
print(exp_mod(6, 3163, 3599))
