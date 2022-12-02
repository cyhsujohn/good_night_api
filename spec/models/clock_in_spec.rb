require "rails_helper"

RSpec.describe ClockIn, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:way) }
    it { is_expected.to validate_inclusion_of(:way).in_array(%w[wake_up sleep]) }
  end
end
