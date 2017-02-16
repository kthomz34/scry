require 'rails_helper'

  

RSpec.describe RegisteredApplication, type: :model do
  let(:app) { create(:registered_application) }
  let(:user) { create(:user) }
  
  it { is_expected.to belong_to(:user) }
  
  describe "attributes" do
    it "has name, & url attributes and user attribute" do
      expect(app).to have_attributes(name: app.name, url: app.url, user: app.user)
    end
  end
end
