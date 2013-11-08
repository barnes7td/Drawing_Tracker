class AddIndexToProjectHistories < ActiveRecord::Migration
  def change
    add_index :project_histories, :project_id
  end
end
