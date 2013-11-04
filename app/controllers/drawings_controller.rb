class DrawingsController < ApplicationController

  def show
    @drawing = Drawing.find(params[:id])
  end

  def create
    project = Project.find(params[:project_id])

    drawing_list = Drawingshorthand.decrypt(params[:drawings])

    drawing_list.each do |drawing|
      drawing_query = Drawing.where(project_id: project.id, number: drawing).all
      if drawing_query.empty?
        project.drawings.create(number: drawing, status: params[:status])
      else
        drawing = drawing_query[0]
        drawing.status = params[:status]
        drawing.save
      end
    end
    redirect_to project_path(params[:project_id])
  end

  def destroy
    drawing = Drawing.find(params[:id])
    drawing.destroy
    redirect_to project_path(drawing.project_id)
  end
end
