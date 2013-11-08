class CreateDrawingHistories < ActiveRecord::Migration
  def change
    create_table :drawing_histories do |t|
      t.integer :drawing_id
      t.string :status
      t.string :notes

      t.timestamps
    end
  end
end
