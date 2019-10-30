require 'rails_helper'

RSpec.describe "TrackEvents", type: :request do
  describe "GET /track_events" do
    it "works!" do
      user = create(:user)    ## uncomment if using FactoryBot
      # user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password") ## uncomment if not using FactoryBot
      sign_in user
      get track_events_path
      expect(response).to have_http_status(200)
    end
  end
end
