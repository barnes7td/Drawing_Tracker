class AddFootageToProjectHistories < ActiveRecord::Migration
  def change
    add_column :project_histories, :footage, :integer
  end
end
