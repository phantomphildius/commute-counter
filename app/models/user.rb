class User < ApplicationRecord
  devise :trackable, :timeoutable, :omniauthable

  has_many :commute_gears, class_name: 'Commute::Gear'
  has_one :commute_fare, class_name: 'Commute::Fare'

  def self.from_omniauth(auth)
    user = find_or_initialize_by(provider: auth.provider, uid: auth.uid)

    user.name = auth.info.name
    user.email = auth.info.username || 'NoUserNameFound'
    user.strava_oauth_token = auth.credentials.token
    user.save!

    user
  end

  # until its a relationship
  def activities
    @activities ||= Strava::Api::Client.new(access_token: strava_oauth_token).athlete_activities
  end
end
