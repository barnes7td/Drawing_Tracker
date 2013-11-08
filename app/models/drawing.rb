class Drawing < ActiveRecord::Base
  attr_accessible :number, :status, :notes

  belongs_to :project
  has_many :drawing_histories

  def self.by_status(project_id)
    where(project_id: project_id).order(:status)
  end

  def self.add_or_update(params, drawing)
    drawing_query = where(project_id: params[:project_id], number: drawing).all
    if drawing_query.empty?
      drawing = create(number: drawing, status: params[:status], notes: params[:notes])
      drawing.drawing_histories.create(status: params[:status], notes: params[:notes])
    else
      drawing = drawing_query[0]
      drawing.status = params[:status]
      drawing.notes = params[:notes] unless params[:notes].empty?
      drawing.save
      drawing.drawing_histories.create(status: params[:status], notes: params[:notes])
    end
  end

end
