require "rails_helper"

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }
  let!(:exist_clock_in) { create(:clock_in, :sleep, user: user) }
  let(:clock_in_response) { response.parsed_body["clock_ins"] }
  describe "POST /users/:id/clock_in" do
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
end
