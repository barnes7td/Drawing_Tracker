class Area < ActiveRecord::Base
  attr_accessible :name

  has_many :erection_drawings
end
