RSpec.configure do |config|
  config.include ActiveJob::TestHelper, type: :job
end

ActiveJob::Base.queue_adapter = :test