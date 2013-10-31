class ErectionDrawing < ActiveRecord::Base
  attr_accessible :number, :revision

  belongs_to :area

  def name
    "#{number}-#{revision}"
  end

end
