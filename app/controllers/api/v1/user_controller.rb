class Api::V1::UserController < ApplicationController
  def create
    begin
      user = User.create(user_params)
      raise 'Bad data' unless user.save
      render json: UserSerializer.new(user), status: 201
    rescue StandardError => err
      render json:{message: err}, status: 400
    end
  end

  def show
    begin
      user = User.find_by(email: user_params[:email])
      raise 'Bad login' unless user && user.authenticate(user_params[:password])
      render json: UserSerializer.new(user)
    rescue StandardError => err
      render json: { message: err }, status: 404
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
