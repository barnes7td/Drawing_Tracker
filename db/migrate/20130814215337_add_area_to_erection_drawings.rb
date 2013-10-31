class AddAreaToErectionDrawings < ActiveRecord::Migration
  def change
    add_column :erection_drawings, :area, :integer, index: true
  end
end
