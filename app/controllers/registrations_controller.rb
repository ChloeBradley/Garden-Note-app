class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :password, :first_name, :last_name))
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Thanks for signing up!"
      redirect_to user_gardens_path(@user)
    else
      render :new
    end
  end
end
