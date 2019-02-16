class Api::V1::ProfileController < ApplicationController

  def index
    user    = User.find_by(api_key: params[:api_key])
    profile = Profile.where(user_id: user.id)
    render json: ProfileSerializer.new(profile), status: 200
  end

  def create
    user = User.find_by(api_key: params[:api_key])
    profile_params[:dob] = Date.parse(params["dob"])
    profile = Profile.create(profile_params)
    render json: ProfileSerializer.new(profile), status: 201
  end

  private

  def profile_params

    params.permit(:given_name, :surname, :height, :weight, :dob,
      :bp_systolic, :bp_diastolic, :heart_rate, :blood_type, :user_id, :provider_id)
  end
end
