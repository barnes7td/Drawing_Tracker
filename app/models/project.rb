class Project < ActiveRecord::Base
  attr_accessible :name, :number, :status

  has_many :drawings
  has_many :project_histories

  def drawings_by_number
    Drawing.where(project_id: id).order(:number).all.
      sort!{|x, y| x.number.to_i <=> y.number.to_i}
  end

  def drawings_by_status
    Drawing.where(project_id: id).order(:status).all
  end

  def number_of_drawings
    number = Drawing.where(project_id: id).all.length
    if number == 0
      "No"
    else
      "(#{number})"
    end
  end

  def percent_in_shop
    percent = (Drawing.where(status: "finished", project_id: id).all.length.to_f / Drawing.where(project_id: id).all.length * 100.0).round(2)
    if percent.nan?
      0.0
    else
      percent
    end
  end

  def no_of_drawings_ready
    number = Drawing.where(status: "ready", project_id: id).all.length
    if number == 0
      "No"
    else
      "(#{number})"
    end
  end

  def no_of_drawings_question
    number = Drawing.where(status: "question", project_id: id).all.length
    if number == 0
      "No"
    else
      "(#{number})"
    end
  end

end
