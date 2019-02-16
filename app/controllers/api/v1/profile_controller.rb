class Api::V1::ProfileController < ApplicationController

  def index
    user = User.find_by(api_key: params[:api_key])
    profile = Profile.find_by(user_id: user.id)
    render json: ProfileSerializer.new(profile), status: 200
  end

  def delete
    id_in = params[:profile_id].to_i
    user = User.find_by(api_key: params[:api_key])
    prof_ids = Profile.where(user_id: user.id).pluck(:id)
    Profile.destroy(id_in) if prof_ids.include?(id_in)
    render json:{message:'Profile deleted!'}, status: 200
  end

end
