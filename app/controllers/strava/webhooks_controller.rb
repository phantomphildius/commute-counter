class Strava::WebhooksController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def index
    challenge = Strava::WebhookChallenge.new(params)

    if challenge.valid?
      render json: challenge.response, status: :ok
    else
      render json: challenge.errors.details, status: :unprocessable_entity
    end
  end

  def create
    event = Strava::WebhookEvent.new(create_params)

    if event.valid?
      ActivityBuilderJob.perform_later(
        strava_user_id: event.owner_id,
        activity_id: event.object_id,
        calculate_transit_time: true
      )
    else
      render json: event.errors.details, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.permit(:aspect_type, :object_id, :object_type, :owner_id)
  end
end
