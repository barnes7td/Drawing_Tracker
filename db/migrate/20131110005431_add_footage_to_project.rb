class AddFootageToProject < ActiveRecord::Migration
  def change
    add_column :projects, :footage, :integer
  end
end
