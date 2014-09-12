class LivrosController < ApplicationController

    def new
        @livro = Livro.new # livro vazio
        # @livro.titulo = 'Titulo do livro'
    end

end
