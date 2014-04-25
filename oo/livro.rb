
class Livro
    attr_accessor :titulo
    #attr_accessor :autores

    def initialize(titulo)
        @titulo = titulo
        @autores = []
    end

    def autores
        @autores
    end

    def add_autor(autor)        
        @autores << autor
        autor.add_livro self
    end

    # sempre definir o to_s (to string)
    def to_s
        @titulo
    end
    
end