# MVC: Model View Controller
# Model = Negocio (+Persistencia)
# View = Apresentacao
# Controller = Controlador = Rotas
# tarefas.rb
require 'sinatra'

require_relative 'tarefa'

tarefas = []

get '/' do
    "Minha tela inicial"
end

get '/tarefa/nova' do
    erb :tarefa_nova
end

post '/tarefa/nova' do
    # debug
    # puts "submeteu a tarefa"
    # puts params

    if params[:titulo].length < 3
        #
    end

    t = Tarefa.new
    t.titulo = params[:titulo]
    t.descricao = params[:descricao]
    t.prioridade = params[:prioridade]
    t.status = 'Nova'
    t.data = Time.new

    tarefas << t

    redirect '/tarefas'
end

get '/tarefas' do
    @tarefas = tarefas
    erb :tarefa_lista
end

get '/tarefa/:titulo' do
    for t in tarefas
        if t.titulo == params[:titulo]
            @tarefa = t
            break
        end
    end
    puts @tarefa.status
    erb :tarefa_ver
end

get '/tarefa/comeca/:titulo' do
    for t in tarefas
        if t.titulo == params[:titulo]
            t.comeca            
        end
    end
    redirect "/tarefa/#{params[:titulo]}"
end

get '/tarefa/suspende/:titulo' do
    for t in tarefas
        if t.titulo == params[:titulo]
            t.suspende            
        end
    end
    redirect "/tarefa/#{params[:titulo]}"
end

get '/tarefa/retoma/:titulo' do
    for t in tarefas
        if t.titulo == params[:titulo]
            t.retoma            
        end
    end
    redirect "/tarefa/#{params[:titulo]}"
end

get '/tarefa/cancela/:titulo' do
    for t in tarefas
        if t.titulo == params[:titulo]
           t.cancela
        end
    end
    redirect "/tarefa/#{params[:titulo]}"
end

get '/tarefa/conclui/:titulo' do
    for t in tarefas
        if t.titulo == params[:titulo]
            t.conclui
        end
    end
    redirect "/tarefa/#{params[:titulo]}"
end