class User < ApplicationRecord
  has_many :task_statuses
end
