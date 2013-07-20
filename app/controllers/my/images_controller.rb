class My::ImagesController < My::BaseMyController

	before_filter :get_project_by_id

	def index
		@images = @project.images.order("created_at ASC")
		@image = @project.images.build
	end

	def create
		@images = @project.images.order("created_at ASC")
		@image = @project.images.build params[:image]
		if @image.save
			redirect_to my_project_images_path (@project)
		else
			flash.now.alert = "Formatt not allowed!"
			render :index
		end
	end

	private

	def get_project_by_id
		@project =  current_user.projects.find params[:project_id]
	end

end
