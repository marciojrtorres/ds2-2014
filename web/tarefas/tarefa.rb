class Tarefa

    attr_accessor :titulo, :descricao,
                  :prioridade, :status, :data

    def pode_comecar?
        @status == 'Nova'        
    end

    def pode_suspender?
        @status == 'Em andamento'
    end

    def pode_retomar?
        @status == 'Suspensa'
    end

    def pode_cancelar?
        @status != 'Cancelada' and @status != 'Concluida'
    end

    def pode_concluir?
        @status == 'Em andamento'        
    end

    def comeca
        @status = 'Em andamento' if pode_comecar?
    end

    def suspende
        @status = 'Suspensa' if pode_suspender?
    end

    def retoma
        @status = 'Em andamento' if pode_retomar?        
    end

    def cancela
         @status = 'Cancelada' if pode_cancelar?
    end

    def conclui
        @status = 'Concluida' if pode_concluir?
    end
end