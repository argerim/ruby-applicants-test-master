class CarModelsController < ApplicationController
  before_action :brand, only: :index

  def index
    uri = URI("http://www.webmotors.com.br/carro/modelos")

    response = Net::HTTP.post_form(uri, { marca: permited_params[:code] })
    models_json = JSON.parse response.body

    models_json.each do |json|
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
