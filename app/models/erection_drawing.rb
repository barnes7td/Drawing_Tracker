class ErectionDrawing < ActiveRecord::Base
  attr_accessible :number, :revision

  belongs_to :project

  def name
    "#{number}  rev - #{revision}"
  end

end
