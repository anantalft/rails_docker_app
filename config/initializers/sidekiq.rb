Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL']}

  # Ensure ActiveRecord is properly connected
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL']}
end