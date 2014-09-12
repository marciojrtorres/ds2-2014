# encoding: UTF-8
#### WINDOWS-1252
class FraseController < ApplicationController

    def initialize
        if not defined? @@frases
            @@frases = [
                'Não tomar antibiótico em jejum',
                'Não derramar suco no seu teclado',
                'A resposta para a vida, para o universo e tudo mais é 42',
                'Antes de ir para o colégio, tome banho',
                'Se beber, não dirija',
                'Se beber, fuja das carroça (sic)',
                'Se usar o cabo de rede, coloque-o de volta'
            ]
        end
    end

    def todas
        @todas = @@frases
    end

    def random
        @frase = @@frases.sample
    end

    def ver
        @numero = params[:numero].to_i
        @frase = @@frases[@numero]
    end

    def busca
        @termo = params[:termo]
        @busca = @@frases.find_all do |f|
            f.downcase.include? @termo.downcase
        end
    end
end