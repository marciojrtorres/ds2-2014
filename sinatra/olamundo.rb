require 'sinatra'

proverbios = ['a ocasiao faz o ladrao',
'quem tem boca fala, mas quem tem dinheiro vai a roma',
'quem com ferro fere com ferro sera ferido']

get '/ola' do
    'ola mundo'
end

get '/sortedodia' do
    proverbios.shuffle.first
end

get '/tchau/:nome' do
    "tchau " + params[:nome]
end