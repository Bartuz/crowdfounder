class ProjectsController < ApplicationController

  def index
  	@projects = Project.order('projects.created_at DESC').page(params[:page])
  end

  def show
    @project = Project.find(params[:id])
  end


  def create
  end

  def new
  end
end
