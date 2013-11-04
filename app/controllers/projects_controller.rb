class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def ready
    @projects = Project.order(drawings: s)
  end
end
