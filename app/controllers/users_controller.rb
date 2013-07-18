class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		login(params[:user][:email], params[:user][:password], true)
  		redirect_to :root, notice: "Account created!"
  	else
      flash.now[:alert] = "Try again"
  		render :new
  	end
  end

end
