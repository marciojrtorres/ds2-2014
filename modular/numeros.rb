# numeros.rb
module Numeros
    def Numeros.impares_ateh(max)
        impares = []
        for n in 1..max
            if n.odd? 
                impares << n
            end
        end
        return impares
    end
end

# Animal > Canino > Cachorro
# superclasse > subclasse

class Numeric
    def dobro
        self * 2
    end
end