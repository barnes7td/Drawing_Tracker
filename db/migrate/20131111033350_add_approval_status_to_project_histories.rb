class AddApprovalStatusToProjectHistories < ActiveRecord::Migration
  def change
    add_column :project_histories, :approval_status, :string
  end
end
