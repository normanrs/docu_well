class Api::V1::ProvidersController < ApplicationController
  def create
    begin
      raise "Bad API key" if find_user == nil
      new_doc = Provider.create(params_in)
      raise 'Bad data' unless new_doc.save
      render json: ProviderSerializer.new(new_doc), status: 201
    rescue StandardError => err
      render json:{message: err}, status: 400
    end
  end

  def index
    providers = Provider.all
    render json: ProviderSerializer.new(providers)
  end

  private

  def params_in
    params.permit(:given_name, :surname, :street_address, :city, :state, :zip, :phone, :speciality)
  end

  def find_user
    User.find_by(api_key: params[:api_key])
  end

end
