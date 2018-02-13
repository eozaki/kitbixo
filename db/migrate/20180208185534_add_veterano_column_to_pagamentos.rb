class AddVeteranoColumnToPagamentos < ActiveRecord::Migration[5.1]
  def change
    add_reference :pagamentos, :veterano, foreign_key: true
  end
end
