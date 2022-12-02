class ClockIn < ApplicationRecord
  validates :action, presence: true, inclusion: {in: %w[wake_up sleep]}

  belongs_to :user
end
