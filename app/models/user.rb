class User < ApplicationRecord
  has_one :submission
  has_many :votes

  def self.find_or_create_from_omniauth!(auth)
    user = find_or_initialize_by(github_uid: auth.uid)
    user.update!(
      github_username: auth.info.nickname,
      github_email: auth.info.email
    )
    user
  end
end
