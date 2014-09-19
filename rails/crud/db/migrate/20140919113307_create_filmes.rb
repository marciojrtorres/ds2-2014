class CreateFilmes < ActiveRecord::Migration
  def change
    create_table :filmes do |t|
      t.string :titulo, limit: 30

      t.timestamps
    end
  end
end
