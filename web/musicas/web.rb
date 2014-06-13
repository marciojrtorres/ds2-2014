require 'sinatra'

get '/'  do
    erb :home   
end

# a href
get '/upload' do
    erb :upload
end

# receber os dados do formulário
post '/upload' do
    # puts params[:arquivo].inspect
    file = 'public/uploads/'+params[:arquivo][:filename]
    conteudo = params[:arquivo][:tempfile].read
    File.open(file, 'w') do |arquivo_novo|
        arquivo_novo.write(conteudo)
    end
    
    @mensagem = "Arquivo salvo"
    # atributos nao sobrevivem a um redirect
    # redirect :upload
    erb :upload
end 

get '/musicas' do
    erb :musicas
end