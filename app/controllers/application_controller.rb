class ApplicationController < ActionController::API

  def err_message(error)
    if error.message[0..2].to_i > 400
      status_number = error.message[0..2].to_i
    else
      status_number = 400
    end
    render json:{message: error}, status: status_number
  end

  def key_check
    begin
      idnum = params_in[:profile_id].to_i
      raise StandardError unless profile_ids.include?(idnum)
    rescue StandardError => err
      raise '401: Must supply a valid API key'
    end
  end

private

  def profile_ids
    Profile.where(user_id: find_user.id).pluck(:id)
  end

  def find_user
    User.find_by(api_key: params["api_key"])
  end

end
