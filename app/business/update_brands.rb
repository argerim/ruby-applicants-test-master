class UpdateBrands

  def initialize
    WebMotorsService.new(:brand, {}).json_parse.each do |brand_params|
      Brand.create(name: brand_params["Nome"], webmotors_code: brand_params["Id"])
    end
  end
end