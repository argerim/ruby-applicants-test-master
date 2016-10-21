class UpdateBrands

  def initialize
    WebMotorsService.new(:brand, {}).json_parse.each do |brand_params|
      @brand = Brand.where(name: brand_params["Nome"]).first_or_create do |brand|
        brand.webmotors_code = brand_params["Id"]
      end
      UpdateCarModelsByBrandJob.perform_later(@brand.id) if @brand.present?
    end
  end
end