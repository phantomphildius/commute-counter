class User < ApplicationRecord
  devise :timeoutable, :omniauthable

  has_many :activities, class_name: 'Commute::Activity'
  has_many :commute_gears, class_name: 'Commute::Gear'
  has_one :commute_fare, class_name: 'Commute::Fare'

  def self.from_omniauth(auth)
    user = create_with(
      name: auth.info.name,
      email: auth.info.username.presence || 'no_user_name_found',
      strava_oauth_token: auth.credentials.token,
      expires_at: Time.at(auth.credentials.expires_at),
      strava_refresh_token: auth.credentials.refresh_token
    ).find_or_initialize_by(provider: auth.provider, uid: auth.uid)

    if user.new_record?
      user.save!
      ActivityBackfillJob.perform_later(user)
      user
    else
      user
    end
  end

  def strava_oauth_token_expired?
    Time.zone.now.after?(expires_at)
  end
end
