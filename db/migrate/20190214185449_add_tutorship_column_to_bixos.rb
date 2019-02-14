class AddTutorshipColumnToBixos < ActiveRecord::Migration[5.1]
  def change
    add_column :bixos, :tutorship, :boolean, default: false
  end
end
