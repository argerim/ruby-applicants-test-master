class UpdateBrands

  def initialize
    WebMotorsService.new(:brand, {}).json_parse.each do |brand_params|
      @brand = Brand.create(name: brand_params["Nome"], webmotors_code: brand_params["Id"])
      UpdateCarModelsByBrand.new(@brand) if @brand.present?
    end
  end
end