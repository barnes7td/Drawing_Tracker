class CreateProjectHistories < ActiveRecord::Migration
  def change
    create_table :project_histories do |t|
      t.string :drawings
      t.string :status
      t.string :notes
      t.integer :project_id

      t.timestamps
    end
  end

  # add_index :project_histories, :project_id
end
