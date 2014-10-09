class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :username, limit: 10
      t.string :password, limit: 32

      t.timestamps
    end
  end
end
