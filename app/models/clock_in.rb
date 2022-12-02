class ClockIn < ApplicationRecord
  validates :way, presence: true, inclusion: {in: %w[wake_up sleep]}

  belongs_to :user
end
