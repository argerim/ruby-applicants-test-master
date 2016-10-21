require './config/environment'

module Clockwork
  every(5.minutes, 'Update Tables Brands and CarModels') { UpdateBrandsAndCarModelsJob.perform_later }
end
