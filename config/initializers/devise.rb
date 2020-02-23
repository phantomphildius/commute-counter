# frozen_string_literal: true

# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]

  config.timeout_in = 10.minutes

  config.omniauth :strava, Rails.application.credentials.strava.fetch(:client_id), Rails.application.credentials.strava.fetch(:secret), scope: 'activity:read_all'
end
