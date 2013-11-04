class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create params[:project]
    redirect_to projects_path
  end

  def ready
    # @projects = Project.order(drawings: s)
  end

  def by_status
    puts "**********************"
    p params
    @project = Project.find(params[:id])
    @drawings = Drawing.by_status(@project)
  end
end
