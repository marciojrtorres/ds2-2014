
i = 0
while i < 10 # condição para entrar no loop
  puts "Iteracao " + i.to_s
  puts "Iteracao #{i}"
  i = i + 1
end

i = 0
until i > 9 # condição para sair do loop
  puts "Iteracao #{i} com until"
  i = i + 1
end

nomes = []    # Array.new
nomes << 'Natalia'
nomes << 'Jamille'
nomes << 'Ramesses'

puts nomes
puts nomes.inspect
p nomes # puts nomes.inspect

for nome in nomes
    puts "-> #{nome};"
end

numeros = [0,1,2,3,4,5]
for n in numeros
  puts n
end

for n in 6..10
  puts n
end

for n in 0..10
  puts n
end

for letra in 'a'..'z'
  puts letra
end

# 8 vezes
for n in 1..8
  print '-'
end

puts ''

50.times do
  print '*'
end

puts ''

15.times { print '#' }
















