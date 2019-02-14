class CreateConfirmations < ActiveRecord::Migration[5.1]
  def change
    create_table :confirmations do |t|
      t.references :bixo, foreign_key: true

      t.timestamps
    end
  end
end
