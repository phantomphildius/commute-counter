class User < ApplicationRecord
  devise :trackable, :timeoutable, :omniauthable

  def self.from_omniauth(auth)
    user = find_or_initialize_by(provider: auth.provider, uid: auth.uid)

    user.name = auth.info.name
    user.email = auth.info.username || 'NoUserNameFound'
    user.strava_oauth_token = auth.credentials.token
    user.save!

    user
  end
end
