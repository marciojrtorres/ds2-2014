# encoding: UTF-8
# encoding: Windows-1252
# encoding: CP-1252
# CRUD: CREATE, READ, UPDATE, DELETE
# ESTADO

# TABELA == CLASSE
# REGISTRO == OBJETO
# CAMPOS == PROPRIEDADES

require 'sinatra'
require 'mysql'

class Contato
    attr_accessor :codigo, :nome,
                  :telefone, :email  

    def salva
        # host, usuario, senha, banco
        db = Mysql.new 'localhost', 'root', 'root', 'agenda'

        sql = nil

        if @codigo.nil?
            sql = "INSERT INTO contatos (nome, telefone, email) " +
                  "VALUES ('#{@nome}', '#{@telefone}', '#{@email}')"
        else
            sql = "UPDATE contatos SET " +
                  "nome = '#{@nome}', telefone = '#{@telefone}', " +
                  "email = '#{@email}' " + 
                  "WHERE codigo = #{@codigo}"
        end

        db.query sql

        db.close # as conexoes devem ser fechadas
    end

    def Contato.lista
        db = Mysql.new 'localhost', 'root', 'root', 'agenda'

        sql = "SELECT * FROM contatos"

        # obter um "result set"
        rs = db.query sql

        lista = []

        # converter resultset em array de contatos
        rs.each_hash do |row|
            contato = Contato.new
            contato.codigo = row['codigo']
            contato.nome = row['nome']
            contato.telefone = row['telefone']
            contato.email = row['email']
            lista << contato
        end

        db.close

        return lista
    end

    def Contato.exclui(codigo)
        db = Mysql.new 'localhost', 'root', 'root', 'agenda'

        db.query "DELETE FROM contatos WHERE codigo = #{codigo}"

        db.close
    end

    def Contato.seleciona(codigo)
        db = Mysql.new 'localhost', 'root', 'root', 'agenda'

        rs = db.query "SELECT * FROM contatos WHERE codigo = #{codigo}"

        contato = nil

        rs.each_hash do |row|
            contato = Contato.new
            contato.codigo = row['codigo']
            contato.nome = row['nome']
            contato.telefone = row['telefone']
            contato.email = row['email']
        end

        db.close     

        return contato   
    end


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

    c.salva

    "Contato #{c.nome} salvo com sucesso"
end

get '/contatos/lista' do
    @contatos = Contato.lista
    erb :lista
end

get '/contatos/exclui' do
    @codigo = params[:codigo]
    erb :exclui
end

post '/contatos/exclui' do
    if params[:confirma] == 'sim'  
        Contato.exclui params[:codigo]
    end
    redirect '/contatos/lista'
end

get '/contatos/edita' do    
    @contato = Contato.seleciona params[:codigo]
    erb :edita
end

post '/contatos/edita' do
    c = Contato.new
    
    c.codigo = params[:codigo]
    c.nome = params[:nome]
    c.telefone = params[:telefone]
    c.email = params[:email] 

    c.salva

    redirect '/contatos/lista'
end