class CreateBixos < ActiveRecord::Migration[5.1]
  def change
    create_table :bixos do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.integer :curso

      t.timestamps
    end
  end
end
