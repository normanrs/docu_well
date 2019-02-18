class Api::V1::AppointmentsController < ApplicationController

  def index
    appointments = Appointment.where(profile_id: params_in[:profile_id])
    render json: AppointmentSerializer.new(appointments), status: 200
  end

  def create
    begin
      id_in = params[:profile_id].to_i
      raise 'Bad API key' unless profile_ids.include?(id_in)

      appointment = Appointment.create(params_in)
      render json: AppointmentSerializer.new(appointment), status: 201
    rescue StandardError => err
      render json:{message: err}, status: 422
    end
  end

  def delete
    begin
      id_in = params[:profile_id].to_i
      appt_in = params_in[:appointment_id].to_i
      raise 'Bad API key' unless profile_ids.include?(id_in)
      Appointment.destroy(appt_in)
      render json:{message:'Appointment deleted!'}, status: 200
    rescue StandardError => err
      render json:{message: err}, status: 422
    end
  end

  private

  def params_in
    params.permit(:profile_id, :datetime, :provider_id, :appointment_id)
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
