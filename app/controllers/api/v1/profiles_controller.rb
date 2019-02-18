class Api::V1::ProfilesController < ApplicationController

  def index
    profile = Profile.where(user_id: find_user.id)
    render json: ProfileSerializer.new(profile), status: 200
  end

  def create
    begin
      raise 'Bad API key' if find_user == nil
      attributes = profile_params
      attributes[:user_id] = find_user.id
      attributes[:dob] = Date.parse(params["dob"])
      profile = Profile.create(attributes)
      raise 'Bad data' unless profile.save
      render json: ProfileSerializer.new(profile), status: 201
    rescue StandardError => err
      render json:{message: err}, status: 400
    end
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
    params.permit(:given_name,
                  :surname,
                  :height,
                  :weight,
                  :dob,
                  :bp_systolic,
                  :bp_diastolic,
                  :heart_rate,
                  :blood_type,
                  :user_id,
                  :provider_id)
  end

  def find_user
    User.find_by(api_key: params[:api_key])
  end
end
