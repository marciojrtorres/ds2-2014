# intro2.rb
puts 'ifrs'.upcase
puts 1.+(2)
#    01234567890123456789012345678901234567890123456789
i = 'Instituto Federal de Educacao, Ciencia e Tecnologia do Rio Grande do Sul'
puts i[3].chr
# substring
puts i[0,5]
puts i[-3,3]
puts 'ifrs'[0]
puts 'ifrs'[-1]
# 0123 
# IFRS
# 4321 (-1, -2, ...)

# boleanos
puts 1 == 1
puts 1 < 1
puts 1 <= 1

idade = gets.to_i
if idade > 17 then    # then eh opcional
  puts 'Maior de idade'
else
  puts 'Menor de idade'
end

puts 'Maior de idade' if idade > 17
# dao o mesmo resultado
puts 'Menor de idade' unless idade > 17
puts 'Menor de idade' if not idade > 17

if not idade > 17
  puts 'Menor de idade'
else
  puts 'Maior de idade'
end
#     0123456
puts 'Natalia'[0,3]
puts "Natalia"[2,5]



