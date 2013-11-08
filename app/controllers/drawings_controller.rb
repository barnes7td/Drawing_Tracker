class DrawingsController < ApplicationController

  def show
    @drawing = Drawing.find(params[:id])
  end

  def create
    project = Project.find(params[:project_id])

    project.project_histories.add_event(params)

    drawing_list = Drawingshorthand.decrypt(params[:drawings])

    drawing_list.each do |drawing|
      project.drawings.add_or_update(params, drawing)
    end
    redirect_to project_path(params[:project_id])
  end

  def destroy
    drawing = Drawing.find(params[:id])
    drawing.destroy
    redirect_to project_path(drawing.project_id)
  end
end
