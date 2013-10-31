class DrawingsController < ApplicationController
  def index
    @erection_drawings = Drawing.erections
  end

  def show
    @drawing = Drawing.find(params[:id])
  end
end
