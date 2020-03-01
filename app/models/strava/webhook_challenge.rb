class Strava::WebhookChallenge
  include ActiveModel::Validations

  def initialize(params)
    @challenge = params['hub.challenge']
    @mode = params['hub.mode']
    @verify_token = params['hub.verify_token']
  end

  validates :challenge, presence: true
  validates :mode, inclusion: { in: %w(subscribe) }, presence: true
  validates :verify_token, inclusion: { in: [Rails.application.credentials.fetch(:strava).fetch(:verify_token)] }, presence: true

  def response
    {
      'hub.challenge': challenge
    }
  end

  private

  attr_reader :challenge, :mode, :verify_token
end
