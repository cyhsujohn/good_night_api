require "rails_helper"

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }
  describe "POST /users/:id/clock_in" do
    let!(:exist_clock_in) { create(:clock_in, :sleep, user: user) }
    let(:clock_in_response) { response.parsed_body["clock_ins"] }
    let(:way) { "wake_up" }
    it "creates new clock in" do
      expect { post "/users/#{user.id}/clock_in", params: {way: way}, as: :json }.to change(ClockIn, :count).by(1)
    end

    before { post "/users/#{user.id}/clock_in", params: {way: way}, as: :json }

    it "returns a created response" do
      expect(response).to be_created
    end

    it "returns all clocked-in times" do
      expect(clock_in_response.first["id"]).to eq(exist_clock_in.id)
      expect(clock_in_response.first["way"]).to eq(exist_clock_in.way)
      expect(clock_in_response.last["id"]).to eq(exist_clock_in.id + 1)
      expect(clock_in_response.last["way"]).to eq(way)
    end
  end

  describe "POST /users/:id/follow" do
    let(:followee) { create(:user) }
    before { post "/users/#{user.id}/follow", params: {followee_id: followee.id}, as: :json }

    it "returns an ok response" do
      expect(response).to be_ok
    end

    it "creates correct follow relationship" do
      expect(user.followees.first).to eq(followee)
      expect(followee.followers.first).to eq(user)
    end
  end
end
