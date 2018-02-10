class DropColumnsFromVendas < ActiveRecord::Migration[5.1]
  def change
    remove_column :vendas, :cor
    remove_column :vendas, :tamanho
  end
end
