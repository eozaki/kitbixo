class AddCanecaColumnToBixo < ActiveRecord::Migration[5.1]
  def change
    add_column :bixos, :caneca, :boolean, default: false
  end
end
