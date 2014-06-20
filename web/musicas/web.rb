require 'sinatra'
require 'fileutils'
require 'securerandom'
require 'mysql'

class Musica
    attr_accessor :id, :nome

    def initialize(id,nome)
        @id = id
        @nome = nome
    end
end

get '/'  do
    erb :home   
end

# a href
get '/upload' do
    erb :upload
end

# receber os dados do formulário
post '/upload' do
    db = Mysql.new '127.0.0.1', 'root', 'root', 'musicas'
    
    id = SecureRandom.uuid
    nome = params[:nome]
    
    sql = "INSERT INTO musicas (id, nome) " +
          "VALUES ('#{id}', '#{nome}')"

    db.query sql
    db.close
    # puts params[:arquivo].inspect
    file = 'public/uploads/' + 
        id + '.' +
        params[:arquivo][:filename].split('.').last

    FileUtils.cp params[:arquivo][:tempfile], file
    #conteudo = params[:arquivo][:tempfile].read
    #File.open(file, 'w') do |arquivo_novo|
    #    arquivo_novo.write(conteudo)
    #end
    
    @mensagem = "Arquivo salvo"
    # atributos nao sobrevivem a um redirect
    # redirect :upload
    erb :upload
end 

get '/musicas' do
    @ordem = params[:ordem] # 

    db = Mysql.new '127.0.0.1', 'root', 'root', 'musicas'
        
    sql = "SELECT * FROM musicas"

    if not @ordem.nil?
        response.set_cookie 'ordem', @ordem
    end

    # nao veio o param e existe no cookie
    if @ordem.nil? and request.cookies.key?('ordem')
        @ordem = request.cookies['ordem']
    end

    # tem ordem e nao eh upload
    if !@ordem.nil? and @ordem != 'upload'        
        sql << " ORDER BY nome"
        sql << " DESC" if @ordem == 'Z-A'
    end
    
    result = db.query(sql)

    @musicas = []

    result.each_hash do |row|
        @musicas << Musica.new(row['id'], row['nome'])
    end

    db.close

    erb :musicas
end