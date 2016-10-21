class CarModelsController < ApplicationController
  before_action :brand, only: :index

  def index
    WebMotorsService.new(:car_model, { marca: permited_params[:code] }).json_parse.each do |json|
      @brand.car_models.create(name: json["Nome"])
    end

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
