class Api::V1::AppointmentsController < ApplicationController

  def index
    err_handle do 
      appointments = Appointment.where(profile_id: params_in[:profile_id])
      render json: AppointmentSerializer.new(appointments), status: 200
    end
  end

  def create
    err_handle do
      appointment = Appointment.create(params_in)
      raise 'Bad data' unless appointment.save
      render json: AppointmentSerializer.new(appointment), status: 201
    end

  end

  def delete
    err_handle do 
      appt_in = params_in[:appointment_id].to_i
      Appointment.destroy(appt_in)
      render json:{message:'Appointment deleted!'}, status: 200
    end
  end

  private

  def params_in
    params.permit(:profile_id, :datetime, :provider_id, :appointment_id)
  end

end
