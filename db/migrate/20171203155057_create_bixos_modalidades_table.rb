class CreateBixosModalidadesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :bixos_modalidades_tables, id: false do |t|
      t.belongs_to :bixo, index: true
      t.belongs_to :modalidade, index: true
    end
  end
end
