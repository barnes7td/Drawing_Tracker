class Drawing < ActiveRecord::Base
  attr_accessible :number, :status, :notes, :footage, :approval_status

  has_paper_trail

  belongs_to :project
  has_many :drawing_histories

  def self.engineering_status
    { "Queue"     => :ready,
      "Detailing" => :in_progress,
      "Approval"  => :approval,
      "Question"  => :question,
      "Returned"  => :ready,
      "Revising"  => :in_progress,
      "Releasing" => :in_progress,
      "Released"  => :finished }
  end

  ENGINEERING_STAGE = self.engineering_status.keys
  APPROVAL_STATUSES = ["Not Approved", "RR", "FAC", "FAS" ]

  def self.by_status(project_id)
    where(project_id: project_id).order(:status)
  end

  def self.add_or_update(params, drawing)
    drawing_query = where(project_id: params[:project_id], number: drawing).all
    if drawing_query.empty?
      footage = params[:footage] || 0
      drawing = create(number: drawing, status: params[:status], notes: params[:notes], approval_status: params[:approval_status] footage: footage)
      # drawing.drawing_histories.create(status: params[:status], notes: params[:notes])
    else
      drawing = drawing_query[0]
      drawing.status = params[:status] unless params[:status].empty?
      drawing.approval_status = params[:approval_status] unless params[:approval_status].empty?
      drawing.notes = params[:notes] unless params[:notes].empty?
      drawing.footage = params[:footage] unless params[:footage].empty?
      drawing.save
      # drawing.drawing_histories.create(status: params[:status], notes: params[:notes])
    end
  end

  def color_status
    self.class.engineering_status[status]
  end
end
