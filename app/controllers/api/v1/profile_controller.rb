class Api::V1::ProfileController < ApplicationController

  def index
    user = User.find_by(api_key: params[:api_key])
    profile = Profile.find_by(user_id: user.id)
    render json: ProfileSerializer.new(profile), status: 200
  end

end
