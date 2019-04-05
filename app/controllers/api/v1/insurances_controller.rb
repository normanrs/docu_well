class Api::V1::InsurancesController < ApplicationController

  def create
    begin
      key_check
      insurance = Insurance.new(params_in)
      if insurance.save
        render json: InsuranceSerializer.new(insurance), status: 201
      else
        raise 'Duplicate record'
      end
    rescue StandardError => err
      if err.message == 'Duplicate record'
        render json:{message: err}, status: 409
      else
        err_message(err) 
      end
    end
  end

  def index
    err_handle do 
      insurances = Insurance.where(profile_id: params[:profile_id])
      render json: InsuranceSerializer.new(insurances)
    end
  end

  def delete
    err_handle do 
      insurance = find_insurance
      insurance.delete
      render json: {"message": "Insurance deleted"}
    end
  end

  private

  def params_in
    params.permit(:insurance_type,
                  :carrier,
                  :id_number,
                  :group_number,
                  :phone_number,
                  :profile_id)
  end

  def find_insurance
    Insurance.find(params[:insurance_id])
  end

end
