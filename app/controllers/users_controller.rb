class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		auto_login(@user)
  		redirect_to :root, notice: "Account created!"
  	else
      flash.now[:alert] = "Try again"
  		render :new
  	end
  end

end
