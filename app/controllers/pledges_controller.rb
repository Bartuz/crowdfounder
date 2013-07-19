class PledgesController < ApplicationController
  
  before_filter :get_project
  before_filter :require_login

  def new
  	@pledge = @project.pledges.build
  end

  def create
  	@pledge = @project.pledges.build(params[:pledge])
  	@pledge.user = current_user 
  	if @pledge.save
  		redirect_to @project, notice: "Thanks for pledging!"
  	else
  		flash.now.alert = "Invalid email or password"
  		render :new
  	end
  end

  def edit
  end

  protected

  def get_project
  	@project = Project.find params[:project_id]
  end

end
