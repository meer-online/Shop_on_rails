class UsersController < ApplicationController
	def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.welcome_email(@user).deliver
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end
end
