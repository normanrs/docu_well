class Api::V1::InsurancesController < ApplicationController

  def create
    begin
      raise 'Bad API key' if find_user == nil
      insurance = Insurance.create(insurance_params)
      render json: InsuranceSerializer.new(insurance), status: 201
    rescue StandardError => err
      render json:{message: err}, status: 422
    end
  end

  def index
    begin
      raise 'Bad API key' if find_user == nil
      insurances = Insurance.where(profile_id: params[:profile_id])
      render json: InsuranceSerializer.new(insurances)
    rescue StandardError => err
      render json:{message: err}, status: 422
    end
  end

  private

  def insurance_params
    params.permit(:insurance_type,
                  :carrier,
                  :id_number,
                  :group_number,
                  :phone_number,
                  :profile_id)
  end

  def find_user
    User.find_by(api_key: params[:api_key])
  end
end
