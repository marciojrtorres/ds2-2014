require_relative 'autor' # require_relative 'autor'
require_relative 'livro'

a1 = Autor.new # instancia da classe == objeto
a1.nome = "Maicon Moraes"
a1.data_nascimento = Time.new 1995, 3, 4
puts a1.nome
puts a1.data_nascimento.year

# construtor, inicializador
a2 = Autor.new("Ana Carolina Pacheco")
puts a2.nome

a3 = Autor.new
puts a3.nome

a4 = Autor.new "Karoline Kasue Miki Finato"
puts a4.nome

puts a4.sobrenome

livro = Livro.new "Java Como Programar"
a11 = Autor.new "Deitel pai"
a12 = Autor.new "Deitel filho"
livro.add_autor a11
livro.add_autor a12

puts livro.autores[0]


a9 = Autor.new "Luiza Osorio"
puts a9

autores = [a1, a2, a4, a9]
p autores

# so eh possivel apos definir o comparable
# puts a1 > a2

a77 = Autor.new 'Chim'
a88 = Autor.new 'Chim'
puts a77.object_id
puts a88.object_id
puts a77 == a88

# so funciona se autor definir comparable
p autores.sort



