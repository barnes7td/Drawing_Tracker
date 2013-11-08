class DrawingHistory < ActiveRecord::Base
  attr_accessible :drawing_id, :notes, :status

  belongs_to :history
end
