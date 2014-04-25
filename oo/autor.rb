class Autor  
    # comparabilidade --------
    include Comparable  

    def <=>(outro)
        @nome <=> outro.nome
    end
    # comparabilidade --------

    # construtores se chamam initialize
    def initialize(nome = "Sem nome")
        @nome = nome
        @livros = []
    end
    # equivalente ao setNome(String nome)
    def nome=(nome)
        # @palavra = atributo do objeto
        @nome = nome
    end
    # equivalente ao getNome()
    def nome
        @nome
    end

    def sobrenome
        @nome.split.last
    end

    def data_nascimento=(data)
        @data = data
    end

    def data_nascimento
        @data
    end

    def add_livro(livro)
        @livros << livro
    end

    def livros
        @livros
    end

    # sempre definir o to_s (to string)
    def to_s
        @nome
    end

end