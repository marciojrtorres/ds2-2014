puts "isso eh uma string"

# strings podem ter aspas simples ou dupla
puts 'isso tambem eh uma string'

# tudo é um objeto, nao existem primitivos
puts 1 # inteiro (Fixnum)
puts 'teste'.class
puts 2.class
puts 2.even? # chamada de um metodo
puts 2.odd?

# no ruby, metodos podem ter interrogacao
# operacoes aritmeticas seguem regra geral
puts 2 + 3 * 9

# potencia **
puts 4 ** 5

# modulo
puts 9 % 5

# tipagem
# variavel
# ruby é pós-tipado, tipagem dinâmica

a = 33 # qual eh o tipo? Fixnum
b = "exemplo" # qual eh o tipo? String

puts a
puts b

puts a.class
puts b.class

# puts b + a # imprimir o que?
# nao eh possivel, devido a tipagem forte

puts a.to_s() + b # to_s = to string = converte para string

# metodos nao precisam ter parenteses (sao opcionais)
puts a.to_s + b ## 33exemplo

puts a + b.to_i ## 33, exemplo em inteiro vale 0

puts "123" + "456" # imprimir o que?

puts "123".to_i + "456".to_i

# entrada de dados

puts "ifrs".chomp # imprimir o que? ifrs

nome = gets

puts nome
puts nome.length
puts nome.chomp.length

sobrenome = gets

puts nome.chomp + ' ' + sobrenome.chomp

marca = gets.chomp
modelo = gets.chomp

# interpolar string (semelhante a concatenar)
puts marca + ' ' + modelo
puts "#{marca} #{modelo}"
puts '#{marca} #{modelo}'
# exemplo, interpolado
puts "1 + 1 = #{1 + 1}"
# mesmo exemplo, concatenado
puts "1 + 1 = " + (1 + 1).to_s






















