require 'rails_helper'

RSpec.describe TrackEventsController, type: :controller do
  login_user
  let(:valid_attributes) {
    u = User.first
    attributes_for(:track_event).merge({user_id: u.id})
  }

  let(:invalid_attributes) {
    {time_now: nil}
  }

  let(:valid_session) {}

  describe "GET #index" do
    it "returns a success response" do
      TrackEvent.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      track_event = TrackEvent.create! valid_attributes
      get :show, params: {id: track_event.to_param}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      track_event = TrackEvent.create! valid_attributes
      get :edit, params: {id: track_event.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new TrackEvent" do
        expect {
          post :create, params: {track_event: valid_attributes}
        }.to change(TrackEvent, :count).by(1)
      end

      it "redirects to the created track_event" do
        post :create, params: {track_event: valid_attributes}
        expect(response).to redirect_to(TrackEvent.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {track_event: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {description: 'Some New Details'}
      }

      it "updates the requested track_event" do
        track_event = TrackEvent.create! valid_attributes
        put :update, params: {id: track_event.to_param, track_event: new_attributes}
        track_event.reload
        expect(track_event.description).to eq('Some New Details')
      end

      it "redirects to the track_event" do
        track_event = TrackEvent.create! valid_attributes
        put :update, params: {id: track_event.to_param, track_event: valid_attributes}, session: valid_session
        expect(response).to redirect_to(track_event)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        track_event = TrackEvent.create! valid_attributes
        put :update, params: {id: track_event.to_param, track_event: invalid_attributes}, session: valid_session
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested track_event" do
      track_event = TrackEvent.create! valid_attributes
      expect {
        delete :destroy, params: {id: track_event.to_param}, session: valid_session
      }.to change(TrackEvent, :count).by(-1)
    end

    it "redirects to the track_events list" do
      track_event = TrackEvent.create! valid_attributes
      delete :destroy, params: {id: track_event.to_param}, session: valid_session
      expect(response).to redirect_to(track_events_url)
    end
  end

end
