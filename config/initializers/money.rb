# encoding : utf-8

MoneyRails.configure do |config|
  config.default_currency = :usd
  config.rounding_mode = BigDecimal::ROUND_HALF_UP
  config.default_format = { no_cents_if_whole: false }
end
