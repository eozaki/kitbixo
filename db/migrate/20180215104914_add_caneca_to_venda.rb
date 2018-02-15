class AddCanecaToVenda < ActiveRecord::Migration[5.1]
  def change
    remove_column :bixos, :caneca
    add_column :vendas, :caneca, :boolean
  end
end
