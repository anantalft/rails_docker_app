require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Cache classes for better performance.
  config.cache_classes = true

  # Eager load code on boot. This is generally recommended in staging and production environments.
  config.eager_load = true

  # Show full error reports only if explicitly enabled (useful for debugging in staging).
  config.consider_all_requests_local = ENV["SHOW_FULL_ERRORS"].present?

  # Enable server timing
  config.server_timing = true

  # Enable/disable caching. Staging should ideally have similar caching settings to production.
  config.action_controller.perform_caching = true
  config.cache_store = :memory_store
  config.public_file_server.headers = {
    "Cache-Control" => "public, max-age=#{1.day.to_i}"
  }

  # Store uploaded files using the same service as production (e.g., AWS S3, GCS, etc.).
  config.active_storage.service = :local

  # Ensure mailer errors are raised to test email workflows in staging.
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_caching = false

  # Set logging level to debug for verbose logs, or info for a cleaner view.
  config.log_level = :debug

  # Use default Rails logger or any configured third-party service (e.g., Loggly, Datadog).
  config.logger = Logger.new($stdout)

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Use default queue adapter for background jobs (or configure for your staging needs).
  config.active_job.queue_adapter = :async

  # Enable asset compression and digests.
  config.assets.js_compressor = :uglifier
  config.assets.compile = false

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Enable verbose query logs for debugging in staging.
  config.active_record.verbose_query_logs = true

  # Don't raise errors on missing translations in staging.
  # config.i18n.raise_on_missing_translations = false

  # Ensure web console is not configured in staging to avoid conflicts.
  # If debugging is needed, use `binding.pry` or better debugging tools.
  config.web_console.permissions = nil if defined?(WebConsole)
end
