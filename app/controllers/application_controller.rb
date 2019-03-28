class ApplicationController < ActionController::API
  # def invalid_user
  #   render json: { message: 'User Not Found' }, status: 404
  # end

  # def obj_check(obj)
  #   begin
  #     raise 'Duplicate record'
  #   end
  #   rescue StandardError => err
  #     if err.message == 'Duplicate record'
  #       render json:{message: err}, status: 409
  #     else
  #       render json:{message: err}, status: 400 
  #     end
  #   end
  # end

  def key_check
    begin
      idnum = params_in[:profile_id].to_i
      raise StandardError unless profile_ids.include?(idnum)
    rescue StandardError => err
      raise '1: Must supply valid API key'
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
