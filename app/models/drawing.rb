class Drawing < ActiveRecord::Base
  attr_accessible :number, :status

  belongs_to :projects

  def self.by_status(project_id)
    where(project_id: project_id).order(:status)
  end

end
