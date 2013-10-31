class AddStatusToErectionDrawings < ActiveRecord::Migration
  def change
    add_column :erection_drawings, :status, :string
  end
end
