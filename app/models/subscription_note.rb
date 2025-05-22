class SubscriptionNote < ApplicationRecord
  belongs_to :subscription
  belongs_to :user

  validates :content, presence: true
end
