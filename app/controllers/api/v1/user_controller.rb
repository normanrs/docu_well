class Api::V1::UserController < ApplicationController
  def create
    user = User.create(user_params)
    saved = user.save!
    if saved
      user.update(api_key: user.create_api_key)
    end
    render json: UserSerializer.new(user), status: 201
  end

  def show
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      render json: UserSerializer.new(user)
    else
      invalid_user
    end
  end

  private

  def user_params
    params.permit(:email, :password, :api_key)
  end
end
