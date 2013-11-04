class Drawing < ActiveRecord::Base
  attr_accessible :number, :status

  belongs_to :projects

end
