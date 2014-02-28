# intro4.rb
# metodos:
# def = define
# def nome_metodo(argumento1, argumento2, argumenton)
# end

def dobro(n) # aqui, parentese nao eh opcional
  return n * 2
end

puts dobro(5)
# para chamar, os parenteses sao opcionais
puts dobro 5
puts dobro 'ds1'
puts 'bla' * 8

def triplo(n)
  n * 3    # return opcional, retorna a ultima instrucao
end

puts triplo 7

def bibliografia(nome,sobrenome)
    "#{sobrenome.upcase}, #{nome}"
end

puts bibliografia('Iago', 'Correa')
puts bibliografia 'Iago', 'Correa'







