class Api::V1::PrescriptionsController < ApplicationController

  def index
    prescriptions = Prescription.where(profile_id: params_in[:profile_id])
    render json: PrescriptionSerializer.new(prescriptions), status: 200
  end

  def create
    begin
      id_in = params[:profile_id].to_i
      raise 'Bad API key' unless profile_ids.include?(id_in)
      prescription = Prescription.create(params_in)
      raise 'Bad data' unless prescription.save
      render json: PrescriptionSerializer.new(prescription), status: 201
    rescue StandardError => err
      render json:{message: err}, status: 400
    end
  end

  def delete
    begin
      id_in = params[:profile_id].to_i
      script_in = params_in[:prescription_id].to_i
      raise 'Bad API key' unless profile_ids.include?(id_in)
      Prescription.destroy(script_in)
      render json:{message:'Prescription deleted!'}, status: 200
    rescue StandardError => err
      render json:{message: err}, status: 400
    end
  end

  private

  def params_in
    params.permit(:profile_id, :provider_id, :prescription_id, :name, :date, :dose, :dose_units, :directions, :refill)
  end

  def find_user
    User.find_by(api_key: params[:api_key])
  end

  def profile_ids
    Profile.where(user_id: find_user.id).pluck(:id)
  end

  def convert_time(unix_string)
    DateTime.striptime(unix_string, '%s')
  end

end
