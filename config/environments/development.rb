Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.digest = true
  config.assets.raise_runtime_errors = true
  config.action_view.raise_on_missing_translations = true

  config.action_mailer.default_url_options = { host: "localhost", port: 3000 }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: "smtp.mailgun.org",
    authentication: :plain,
    domain: "memknow.mailgun.org",
    enable_starttls_auto: true,
    password: "c2579318491ad3328b7b22aaf5c41241"
    port: 587,
    user_name: "postmaster@memknow.mailgun.org",
  }
end
