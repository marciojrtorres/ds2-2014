# encoding: UTF-8
class FilmesController < ApplicationController

    def index
        @filmes = Filme.all
    end

    def new
        @filme = Filme.new
    end

    def edit
        @filme = Filme.find(params[:id])
    end

    def create
        @filme = Filme.new(params.require(:filme).permit(:titulo))
        if @filme.save
            redirect_to :filmes, notice: "Filme #{@filme.titulo} salvo"
        else
            render :new
        end
    end

    def update
        @filme = Filme.find(params[:id])
        if @filme.update(params.require(:filme).permit(:titulo))
            redirect_to :filmes, notice: "Filme #{@filme.titulo} atualizado"
        else
            render :edit
        end
    end


    def destroy
        f = Filme.find(params[:id])
        f.destroy
        redirect_to :filmes, notice: "Filme #{f.titulo} excluído"
    end

    def show
        @filme = Filme.find(params[:id])
    end

end