class Api::V1::AppointmentsController < ApplicationController

  def index
    begin
      key_check
      appointments = Appointment.where(profile_id: params_in[:profile_id])
      render json: AppointmentSerializer.new(appointments), status: 200
    rescue StandardError => err
      err_message(err)
    end
  end

  def create
    begin 
      key_check
      appointment = Appointment.create(params_in)
      raise 'Bad data' unless appointment.save
      render json: AppointmentSerializer.new(appointment), status: 201
    rescue StandardError => err
      err_message(err)
    end
  end

  def delete
    begin
      key_check
      appt_in = params_in[:appointment_id].to_i
      Appointment.destroy(appt_in)
      render json:{message:'Appointment deleted!'}, status: 200
    rescue StandardError => err
      err_message(err)
      # render json:{message: err}, status: 400
    end
  end

  private

  def params_in
    params.permit(:profile_id, :datetime, :provider_id, :appointment_id)
  end

end
