class ProjectsController < ApplicationController
  def show
  end

  def index
  	@projects = Project.all
  end

  def create
  end

  def new
  end
end
