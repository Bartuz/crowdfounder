class My::ProjectsController < My::BaseMyController

	before_filter :get_project_by_id, only: [:edit,:update,:destroy]

	def index
		@projects = current_user.projects.all
	end

	def edit
	end

	def update

	end

	private

	def get_project_by_id
		@project = current_user.projects.find params[:id]
		if @project.update_attributes params[:project]
			redirect_to my_projects_path
		else
			flash.now.alert = "Something went wrong... Try again!"
			render :update
		end
	end

end
