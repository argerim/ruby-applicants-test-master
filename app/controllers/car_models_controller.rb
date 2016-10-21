class CarModelsController < ApplicationController
  before_action :brand, only: :index

  def index
    UpdateCarModelByBrandJob.perform_later(@brand.id) if @brand.present?
    @car_models = @brand.car_models
  end

  private

    def brand
      @brand = Brand.find_by(webmotors_code: permited_params[:code])
    end

    def permited_params
      params.require(:webmotors).permit(:code)
    end
end
