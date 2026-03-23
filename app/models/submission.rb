class Submission < ApplicationRecord
  belongs_to :user
  has_many :votes

  validates :line1, :line2, :line3, presence: true

  scope :kept, -> { where(discarded_at: nil) }
  scope :discarded, -> { where.not(discarded_at: nil) }

  def discard
    update(discarded_at: Time.current)
  end

  def restore
    update(discarded_at: nil)
  end

  def discarded?
    discarded_at.present?
  end

  def editable?
    return true unless persisted?

    created_at > 1.hour.ago
  end
end
