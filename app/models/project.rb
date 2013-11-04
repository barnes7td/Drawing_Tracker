class Project < ActiveRecord::Base
  attr_accessible :name, :number, :status

  has_many :drawings

  def drawings_by_number
    Drawing.where(project_id: id).order(:number).all.
      sort!{|x, y| x.number.to_i <=> y.number.to_i}
  end

  def drawings_by_status
    Drawing.where(project_id: id).order(:status).all
  end

  def percent_in_shop
    (Drawing.where(status: "finished", project_id: id).all.length.to_f / Drawing.where(project_id: id).all.length * 100.0).round(2)
  end

end
