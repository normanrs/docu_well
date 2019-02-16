class Api::V1::ProfilesController < ApplicationController

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

  def delete
    id_in = params[:profile_id].to_i
    user = User.find_by(api_key: params[:api_key])
    prof_ids = Profile.where(user_id: user.id).pluck(:id)
    Profile.destroy(id_in) if prof_ids.include?(id_in)
    render json:{message:'Profile deleted!'}, status: 200
  end

  private

  def profile_params

    params.permit(:given_name, :surname, :height, :weight, :dob,
      :bp_systolic, :bp_diastolic, :heart_rate, :blood_type, :user_id, :provider_id)
  end
end
