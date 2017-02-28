require 'rails_helper'

RSpec.describe API::EventsController, type: :controller do
  
  let(:user)  { create(:user) }
  let(:app)   { create(:registered_application) }
  let(:event) { app.events.create(name: Faker::Hipster.word) }
  
  describe "POST create" do
    context "with valid attributes" do
      before do
        request.env['HTTP_ORIGIN'] = app.url
        post :create, event: { name: event.name }
      end
  
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
    end
    
    context "with invalid attributes" do
      before do
        request.env['HTTP_ORIGIN'] = "juice.url"
        post :create, event: { name: event.name }
      end
  
      it "returns http :unprocessable_entity" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
  
  describe "GET #preflight" do
    it "returns http success" do
      get :preflight
      expect(response).to have_http_status(:success)
    end
  end
end
