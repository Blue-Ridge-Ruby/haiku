class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :submission

  validates :user_id, uniqueness: { scope: :submission_id }
  validate :not_own_submission

  private

  def not_own_submission
    if submission && user_id == submission.user_id
      errors.add(:base, "You cannot vote on your own submission")
    end
  end
end
