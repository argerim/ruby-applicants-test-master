class UpdateCarModelsByBrand

  def initialize(brand)
    @brand = brand
    WebMotorsService.new(:car_model, { marca: @brand.webmotors_code }).json_parse.each do |json|
      @brand.car_models.create(name: json["Nome"])
    end
  end
end