class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.string :number
      t.string :status
      t.integer :project_id

      t.timestamps
    end

    add_index :drawings, :project_id
  end
end
