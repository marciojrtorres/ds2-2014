# objetos: características, comportamento
# aplica abstração
# classe Agua, com temperatura,
# ignorando a pressão (abstraindo a pressão),
# com temperatura gradual (step 1 grau)

class Agua

    # attr_accessor :temperatura

    def initialize(t = 20)
        @temperatura = t
    end

    def temperatura
        @temperatura
    end
  
    def gasosa? # metodos com retorno boleano, terminam com ?
        # if temperatura > 100 return true
        @temperatura > 100
    end

    def solida?
        @temperatura < 0
    end

    def liquida?
        @temperatura > -1 and @temperatura < 101
    end

    def aquece
        @temperatura += 1
    end

    def esfria
        @temperatura -= 1
    end

    def evapora
        self.aquece until self.gasosa?
    end

    def to_s   # sempre implementem o to_s
        "agua a #{@temperatura} graus"
    end
end

agua = Agua.new 29
puts agua
puts agua.gasosa?  # false
puts agua.solida?  # false
puts agua.liquida? # true

agua.aquece
puts agua.temperatura # 30
# while not agua.gasosa?
#    agua.aquece
# end
# agua.aquece while not agua.gasosa?
agua.aquece until agua.gasosa?

puts agua.temperatura
puts agua.gasosa?

agua.esfria until agua.solida?

puts agua.temperatura
puts agua.solida?

agua.evapora

puts agua.temperatura
puts agua.gasosa?