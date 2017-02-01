class LoginController < ApplicationController
    def index
    end
    
    def create
      @user = User.find_by(params[:username])
    end
end
