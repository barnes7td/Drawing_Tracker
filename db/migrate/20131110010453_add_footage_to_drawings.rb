class AddFootageToDrawings < ActiveRecord::Migration
  def change
    add_column :drawings, :footage, :integer
  end
end
