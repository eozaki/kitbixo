class CreateVeteranos < ActiveRecord::Migration[5.1]
  def change
    create_table :veteranos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
