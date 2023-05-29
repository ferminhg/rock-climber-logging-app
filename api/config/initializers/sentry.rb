# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = 'https://146e643747f648bb8e9125a905ac11bd@o4504383586041856.ingest.sentry.io/4505269126823936'
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |_context|
    true
  end
end
