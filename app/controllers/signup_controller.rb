class SignupController < ApplicationController
  def index
    unless current_user
      @user = User.new
    end
  end
  
  private
    def user_params
      params.require(:email).permit(:email, :username, :password, :password_confirmation)
    end
  
  def create
    @user = User.new(user_params)
    if user_params.password == user_params.password_confirmation
      @user.save
      render '/signup/create.html.erb'
    else
      render '/signup/error.html.erb'
    end
  end
end