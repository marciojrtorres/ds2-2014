# encoding: UTF-8
# encoding: Windows-1252
# encoding: CP-1252
# CRUD: CREATE, READ, UPDATE, DELETE
# ESTADO

require 'sinatra'

class Contato
    attr_accessor :nome, :telefone, :email  

    def to_s
        @nome
    end  
end

contatos = []

# rota raiz
get '/' do
    erb :index
end

# rotas:
get '/contatos' do
    erb :contatos
end

get '/contatos/novo' do
    erb :novo
end

post '/contatos/novo' do
    c = Contato.new 
    c.nome = params[:nome]
    c.telefone = params[:telefone]
    c.email = params[:email]    

    contatos << c

    "Contato #{c.nome} salvo com sucesso"
end

get '/contatos/lista' do
    @contatos = contatos
    erb :lista
end

get '/contatos/exclui' do
    @nome = params[:nome]
    erb :exclui
end

post '/contatos/exclui' do
    if params[:confirma] == 'sim'  
        contatos.delete_if do |c| # pipe
            c.nome == params[:nome]
        end
    end
    redirect '/contatos/lista'
end

get '/contatos/edita' do    
    @contato = contatos.select { |c| c.nome == params[:nome] }.first
    erb :edita
end

post '/contatos/edita' do
    c = contatos.select { |c| c.nome == params[:nome_antigo] }.first
    c.nome = params[:nome]
    c.telefone = params[:telefone]
    c.email = params[:email] 

    redirect '/contatos/lista'
end