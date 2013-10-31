class AddProjectsToErectionDrawings < ActiveRecord::Migration
  def change
    add_column :erection_drawings, :project_id, :integer
    add_index  :erection_drawings, :project_id
  end
end
