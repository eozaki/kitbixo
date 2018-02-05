class CreateVendas < ActiveRecord::Migration[5.1]
  def change
    create_table :vendas do |t|
      t.string :tamanho, default: "M", null: false
      t.string :cor, default: "Vermelho", null: false
      t.belongs_to :bixo, index: true, null: false

      t.timestamps
    end
  end
end
