class AddApprovalStatusToDrawings < ActiveRecord::Migration
  def change
    add_column :drawings, :approval_status, :string
  end
end
