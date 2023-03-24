class UsersController < ApplicationController
   before_action :authorize
   skip_before_action :authorize, only: [:create]

  def create 
    user = User.create(user_params)
    if user.valid? 
        session[:user_id]= user.id
        render json: user
    else 
        render json:{error:"unauthorized"}, status: 422
    end

  end

  def show 
   user = User.find(session[:user_id])
   render json: user
  end

  private 

  def user_params 
    params.permit(:username, :password, :password_confirmation)
  end

  def authorize 
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

end
