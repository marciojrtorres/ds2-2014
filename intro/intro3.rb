# intro3.rb
d = gets.chomp

if d == 'ds1'
  puts 'Desenvolvimento de Sistemas I'
elsif d == 'ds2'
  puts 'Desenvolvimento de Sistemas II'
else
  puts 'Nao sei'
end

# equivalente ao switch
case d
when 'ds1'
  puts 'Desenvolvimento de Sistemas I'
when 'ds2'
  puts 'Desenvolvimento de Sistemas II'
when 'es'
  puts 'Engenharia de Software'
else
  puts 'Nao sei'
end



