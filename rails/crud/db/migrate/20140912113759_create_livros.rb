class CreateLivros < ActiveRecord::Migration
  def change
    create_table :livros do |t|
      t.string :titulo, limit: 30
      # t.string :subtitulo, limit: 50
      t.integer :ano

      t.timestamps
    end
  end
end
