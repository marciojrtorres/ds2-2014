# encoding: UTF-8
class Filme < ActiveRecord::Base

    validates :titulo,
              presence: {message: 'O título é obrigatório'},
              uniqueness: {message: 'Já existe título'}

end
