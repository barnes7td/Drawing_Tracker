class AddNotesToDrawings < ActiveRecord::Migration
  def change
    add_column :drawings, :notes, :string
  end
end
