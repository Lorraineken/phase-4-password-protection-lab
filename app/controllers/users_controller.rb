class UsersController < ApplicationController
   

  def create 
    user = User.create!(user_params)
    session[:user_id]= user.id
    render json: user
  end

  def show 
   user = User.find(session[:user_id])
    if user.&authenticate(params[:password])
        render json: user
    end
  end

  private 

  def user_params 
    params.permit(:username, :password, :password_confirmation)
  end

end
