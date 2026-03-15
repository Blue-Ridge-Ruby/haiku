class User < ApplicationRecord
  has_one :submission

  def self.find_or_create_from_omniauth(auth)
    find_or_create_by(github_uid: auth.uid) do |user|
      user.github_username = auth.info.nickname
      user.github_email = auth.info.email
    end.tap do |user|
      user.update(
        github_username: auth.info.nickname,
        github_email: auth.info.email
      )
    end
  end
end
