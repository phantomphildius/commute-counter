class Strava::WebhookEvent
  include ActiveModel::Validations

  attr_reader :object_id, :owner_id

  def initialize(event_params)
    @object_id = event_params[:object_id]
    @aspect_type = event_params[:aspect_type]
    @object_type = event_params[:object_type]
    @owner_id = event_params[:owner_id]
  end

  validates :object_id, :owner_id, presence: true
  validates :aspect_type, inclusion: { in: %w(create) }, presence: true
  validates :object_type, inclusion: { in: %w(activity) }, presence: true

  private

  attr_reader :aspect_type, :object_type
end
