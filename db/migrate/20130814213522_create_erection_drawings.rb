class CreateErectionDrawings < ActiveRecord::Migration
  def change
    create_table :erection_drawings do |t|
      t.string :number
      t.integer :revision

      t.timestamps
    end
  end
end
