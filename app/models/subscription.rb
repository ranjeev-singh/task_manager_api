class Subscription < ApplicationRecord
  belongs_to :user
  
  validates :external_id, presence: true, uniqueness: true
end
