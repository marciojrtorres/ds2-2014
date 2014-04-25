=begin
1.0 O método recebe dois arrays de 2 números, que representam duas frações, e 
faz sua soma, devolvendo um array que representa a fração resposta, que não
precisa estar simplificada. 

# Casos de teste:
puts fracao_soma([2, 4], [6, 4]) == [8, 4]   # true
puts fracao_soma([2, 3], [3, 4]) == [17, 12] # true
puts fracao_soma([2, 9], [3, 6]) == [13, 18] # true    
=end

def mdc(a,b)
    # euclides
    dd = a
    dv = b
    r = 0
    while (r = dd % dv) > 0
        dd = dv
        dv = r
    end
    dv
end

def mmc(a,b)
    a * b / mdc(a,b)
    #for i in 1..(a*b)
    #    return i if i % a == 0 and i % b == 0
    #end
end

def fracao_soma(f1, f2)
    return [f1[0] + f2[0], f1[1]] if f1[1] == f2[1]
    mmc = mmc(f1[1], f2[1])
    return [(mmc / f1[1] * f1[0]) + (mmc / f2[1] * f2[0]), mmc]
end

p fracao_soma([2, 4], [6, 4])
puts fracao_soma([2, 4], [6, 4]) == [8, 4]   # true

p fracao_soma([2, 3], [3, 4])
puts fracao_soma([2, 3], [3, 4]) == [17, 12] # true

p fracao_soma([2, 9], [3, 6])
puts fracao_soma([2, 9], [3, 6]) == [13, 18] # true    