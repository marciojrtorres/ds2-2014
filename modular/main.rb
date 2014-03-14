# main.rb
# require_relative 
require 'numeros'
require 'texto'

numeros = Numeros.impares_ateh(10)
p numeros
puts numeros == [1,3,5,7,9]

puts Texto.palindrome? 'texto' # false
puts Texto.palindrome? 'arara' # true
puts 'erro'.palindrome?
puts 'erre'.palindrome?

puts 3.dobro

puts 5.quadrado # 25
puts 5.cubo     # 125
# 6 = 3 + 2 + 1 = 6
# 8 = 4 + 2 + 1 = 7
puts 8.perfect? # false
puts 6.perfect? # true







