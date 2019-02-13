class Api::V1::ProfileController < ApplicationController

  def index
    profile = Profile.find(1)
    render json: ProfilesSerializer.new(profile), status: 200
  end

end
