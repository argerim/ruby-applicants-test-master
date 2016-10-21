class UpdateBrandsAndCarModelsJob < ActiveJob::Base
  queue_as :default

  def perform
    UpdateBrands.new
  end
end