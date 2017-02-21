require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { create(:event) }
  it { is_expected.to belong_to(:registered_application) }
  
  describe "attributes" do
    it "has name attribute" do
      expect(event).to have_attributes(name: event.name)
    end
  end
end
