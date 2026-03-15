class Current < ActiveSupport::CurrentAttributes
  attribute :user

  delegate :admin?, to: :user, allow_nil: true
end
