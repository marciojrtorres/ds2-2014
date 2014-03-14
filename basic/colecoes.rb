nomes = []
p nomes
nomes = Array.new
p nomes
nomes = ['Julie', 'Luiza','Renan', 'Gabriel']
p nomes[2]
p nomes
nomes = %w{Ana Iago Joao Pedro Felipe}
p nomes

p nomes.methods

# adicionar
nomes << 'Maickel'
nomes << 'Bruno'

# remover
nomes.delete 'Ana'
p nomes

# acessar o indice
p nomes[4]
p nomes[-4]
p nomes[-1]
p nomes.last
p nomes.first

#  0    1   2    3
# [DBO, ES, DS1, DS2]
#  -4   -3  -2   -1

p nomes[2,5] # slice (fatiar)

p nomes.slice 2,5

# classifica
p nomes.sort

# inverte
p nomes.reverse


# imutabilidade
numeros = (1..10).to_a
p numeros
p numeros.shuffle
p numeros
p numeros.shuffle!
p numeros

# hashes (Java: Map, C#: Dictionary, PHP: Array associativo)
# tipo de coleção chave/valor

disc = Hash.new
disc['dbo'] = 'A gente faz objetos'
disc['banco'] = 'Eu gosto de SELECT'
disc['es'] = 'desliguem as conexao (sic)'

p disc

puts disc['banco']

es = disc['es']
puts es

p disc.keys
p disc.values

for chave, valor in disc
   puts "#{chave} #{valor}"
end

musicas = {} # mesmo que Hash.new
musicas['Paul Simon'] = ['The Sound of Silence', 'The Boxer']
musicas['Imagine Dragons'] = ['Its Time', 'Radioactive']

p musicas
puts musicas['Paul Simon']

musicas['Paul Simon'] << 'Graceland'
puts musicas['Paul Simon']

musicas['Eminem'] = Hash.new
musicas['Eminem']['Encore'] = ['Mocking bird']
musicas['Eminem']['Relapse'] = ['Brain Damage']

p musicas['Eminem']
p musicas['Eminem']['Encore']
p musicas['Eminem']['Relapse'][1]


filmes = {'ficcao' => ['Starwars','Gravity']}
p filmes

estado_cidades = {'RS' => 89, 'SC' => 76}
puts estado_cidades['RS'] 
puts estado_cidades['SC'] 


