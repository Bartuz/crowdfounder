class My::BaseMyController < ApplicationController

	protected

	def get_project_by_id
		if current_user.projects.exists? params[:id]
		  @project =  current_user.projects.find params[:id]
		else
		  raise ActionController::RoutingError.new("Not Found")
		end
	end

end
