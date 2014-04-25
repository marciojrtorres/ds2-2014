# 
#  modelar tempo decorrido

class Hora
    include Comparable # traz os metodos == != > < >= <= between?
    # depende de <=>
    def <=>(outra_hora)
        @ts <=> outra_hora.ts
    end

    def initialize(h = 0, m = 0, s = 0)
        @ts = h * 3600 + m * 60 + s
    end

    # metodo da classe (Hora.meia_hora)
    # metodos fabrica
    def self.meia_hora
        Hora.new 0, 30, 0
    end

    def self.um_dia
        Hora.new 24, 0, 0
    end

    def self.dias(dias)
        Hora.new dias * 24, 0, 0
    end

    def horas
        @ts / 3600
    end

    def minutos
        @ts % 3600 / 60
    end

    def segundos
        @ts % 3600 % 60
    end

    def +(h)
        @ts += h * 3600 if h.kind_of? Fixnum   
        if h.kind_of? Hora
            @ts += h.horas * 3600 + h.minutos * 60 + h.segundos
        end         
    end

    def to_s
        "#{self.horas}:#{self.minutos}:#{self.segundos}"
    end

    def inspect # serve para debug
        "#{@ts}s = #{self.to_s}"
    end

    # apenas objetos Hora (e subclasses)
    # podem ler este metodo
    protected
    def ts
        @ts 
    end    

end

# 3700
# -3600
# 100 - 60
# 40
# 1h 1m 40s
h = Hora.new
puts h
p h # puts h.inspect
puts h.horas    # 0
puts h.minutos  # 0
puts h.segundos # 0

h = Hora.new 3, 10, 25
# h * 3600
# m * 60
# s
puts h
puts h.inspect
puts h.horas    # 3
puts h.minutos  # 10
puts h.segundos # 25

h + 20 # sobrecarga de operador
p h
h + 12.6
p h

h2 = Hora.new 0, 2, 0
h + h2
p h

h3 = Hora.new 0, 30, 0
p h3

h4 = Hora.new 0, 30, 0
p h4

h5 = Hora.meia_hora
p h5

h6 = Hora.um_dia
p h6 # 24:0:0

h7 = Hora.dias 3
p h7

varias_horas = [h,h2,h3,h4,h5]
p varias_horas

p Hora.meia_hora == Hora.meia_hora