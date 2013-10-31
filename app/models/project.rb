class Project < ActiveRecord::Base
  attr_accessible :name, :number, :status

  has_many :erection_drawings

  def percent_in_shop
    puts "#####################################################"
    p ErectionDrawing.where(status: "shop", project_id: self.id).all.length
    p ErectionDrawing.all.length
    ErectionDrawing.where(status: "shop", project_id: self.id).all.length.to_f / ErectionDrawing.all.length * 100.0
  end
end
