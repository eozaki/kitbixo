class CreateVendas < ActiveRecord::Migration[5.1]
  def change
    create_table :vendas do |t|
      t.string :tamanho, default: "M", null: false
      t.string :cor, default: "Vermelha", null: false
      t.belongs_to :bixo, index: true

      t.timestamps
    end
  end
end
