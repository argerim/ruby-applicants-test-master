require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { size: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { size: 9 }
  config.server_middleware do |chain|
    chain.add Sidekiq::Middleware::Server::RetryJobs, max_retries: 3
  end
end

SidekiqUniqueJobs.config.unique_args_enabled = true
