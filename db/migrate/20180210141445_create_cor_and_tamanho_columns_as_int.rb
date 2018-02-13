class CreateCorAndTamanhoColumnsAsInt < ActiveRecord::Migration[5.1]
  def change
    add_column :vendas, :cor, :integer
    add_column :vendas, :tamanho, :integer
  end
end
