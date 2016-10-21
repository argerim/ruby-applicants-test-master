require './config/environment'

module Clockwork
  every(10.minutes, 'Update Tables Brands') { UpdateBrandsJob.perform_later }
end
