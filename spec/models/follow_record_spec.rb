require "rails_helper"

RSpec.describe FollowRecord, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:follower) }
    it { is_expected.to belong_to(:followee) }
  end
end
