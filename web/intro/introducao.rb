# encoding: UTF-8

require 'sinatra'
require 'mysql'

class Contato
    attr_accessor :codigo, :nome,
                  :telefone, :email 

    attr_reader :erros

    def salva
        # host, usuario, senha, banco
        db = Mysql.new '127.0.0.1', 'root', 'root', 'agenda'

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
        db = Mysql.new '127.0.0.1', 'root', 'root', 'agenda'

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
        db = Mysql.new '127.0.0.1', 'root', 'root', 'agenda'

        db.query "DELETE FROM contatos WHERE codigo = #{codigo}"

        db.close
    end

    def Contato.seleciona(codigo)
        db = Mysql.new '127.0.0.1', 'root', 'root', 'agenda'

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

    def valido?
        @erros = []

        if @nome.length < 4
            @erros << "Nome invalido: deve ter pelo menos 4 caracteres"
        end

        if (@telefone =~ /^\d{8}$/).nil?
            @erros << "Telefone invalido: deve ter 8 digitos"
        end
        # expressões regulares     
        @erros.empty?  
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
    @contato = Contato.new
    erb :novo
end

post '/contatos/novo' do
    @contato = Contato.new 
    @contato.nome = params[:nome]
    @contato.telefone = params[:telefone]
    @contato.email = params[:email]    

    if @contato.valido?
        @contato.salva
        redirect '/contatos/lista'   
    else
        erb :novo
    end
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