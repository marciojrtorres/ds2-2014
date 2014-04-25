def nome_biblio(autor)
    sobrenomes = %w{FILHO JUNIOR NETO NETA}
    palavras = autor.split
    biblio = palavras.pop.upcase
    if sobrenomes.include? biblio
        biblio = palavras.pop.upcase + ' ' + biblio
    end
    biblio << ',' unless palavras.empty?    
    for p in palavras
        biblio << ' ' << p.capitalize
    end
    biblio
end

a1 = "jamille silveira"
a2 = nome_biblio(a1)

puts a1
puts a2

puts nome_biblio 'francisco elizeu mendes'
puts nome_biblio 'ramesses augusto serra neto'