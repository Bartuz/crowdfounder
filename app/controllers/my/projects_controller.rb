class My::ProjectsController < My::BaseMyController

	before_filter :get_project_by_id, only: [:edit,:update,:destroy]

	def index
		@projects = current_user.projects.all
	end

	def edit
	end

	def update
		if @project.update_attributes params[:project]
			redirect_to my_projects_path
		else
			flash.now.alert = "Something went wrong... Try again!"
			render :update
		end
	end

	def new
		@project = current_user.projects.build
	end

	def create
		@project = current_user.projects.build params[:project]
		if @project.save
			redirect_to my_projects_path, notice: "Project published!"
		else
			flash.now.alert = "Something went wrong... Try again!"
			render :new
		end
	end

	def destroy
		@project.destroy
		redirect_to my_projects_path, notice: "#{@project.title} deleted!"
	end

end
