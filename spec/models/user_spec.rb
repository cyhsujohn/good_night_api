require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Associations" do
    it { is_expected.to have_many(:clock_ins) }
    it { is_expected.to have_many(:duration_of_sleeps) }
    it { is_expected.to have_many(:followees).through(:following_records) }
    it { is_expected.to have_many(:followers).through(:followed_records) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end
end
