require 'rails_helper'

RSpec.describe ClockIn, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:action) }
    it { is_expected.to validate_inclusion_of(:action).in_array(%w[wake_up sleep]) }
  end
end
