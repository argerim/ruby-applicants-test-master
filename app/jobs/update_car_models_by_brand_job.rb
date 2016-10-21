class UpdateCarModelByBrandJob < ActiveJob::Base
  queue_as :default

  def perform(brand_id)
    brand = Brand.find(brand_id)
    UpdateCarModelsByBrand.new(brand)
  end
end