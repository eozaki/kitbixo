class CreatePagamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :pagamentos do |t|
      t.decimal :valor
      t.belongs_to :venda, index: true

      t.timestamps
    end
  end
end
