# encoding: UTF-8

require 'sinatra'

class Perfil
    attr_accessor :nome, :idade, :email
    attr_accessor :estilos, :artista_preferido
    attr_accessor :senha, :pergunta_secreta
end

perfis = []

# rota raiz
get '/' do
    erb :index
end

get '/registro_1' do
    erb :registro_1
end

post '/registro_2' do
    # o que veio do 1
    @nome  = params[:nome]
    @idade = params[:idade]
    @email = params[:email]
    erb :registro_2 
end

post '/registro_3' do
    # o que veio do 2
    @nome  = params[:nome]
    @idade = params[:idade]
    @email = params[:email]
    @estilos = params[:estilos]
    @artista_preferido = params[:artista_preferido]
    erb :registro_3
end

post '/concluir_registro' do
    p = Perfil.new
    p.nome = params[:nome]
    p.idade = params[:idade]
    p.email = params[:email]
    p.estilos = params[:estilos]
    p.artista_preferido = params[:artista_preferido]
    p.senha = params[:senha]
    p.pergunta_secreta = params[:pergunta_secreta]
    p.inspect
end