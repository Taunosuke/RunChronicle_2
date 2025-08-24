Rails.application.configure do
  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  config.assets.compile = false
  config.active_storage.service = :local
  config.force_ssl = true
  config.logger = ActiveSupport::Logger.new(STDOUT)
    .tap  { |logger| logger.formatter = ::Logger::Formatter.new }
    .then { |logger| ActiveSupport::TaggedLogging.new(logger) }
  config.log_tags = [ :request_id ]
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.active_support.report_deprecations = false
  config.active_record.dump_schema_after_migration = false
  config.active_record.attributes_for_inspect = [ :id ]

  config.hosts << "runchronicle.jp"
  config.hosts << "www.runchronicle.jp"
  config.hosts << "runchronicle-2.onrender.com"

  # Render環境での追加設定
  if ENV["RENDER"] && ENV["RENDER_EXTERNAL_HOSTNAME"]
    config.hosts << ENV["RENDER_EXTERNAL_HOSTNAME"]
  end
  config.action_mailer.default_url_options = {
  host: ENV["APP_HOST"] || "runchronicle.jp",
  protocol: ENV["APP_PROTOCOL"] || "https"
}
end
