require "rails_helper"

RSpec.describe "animal_types#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/animal_types/#{animal_type.id}"
  end

  describe "basic destroy" do
    let!(:animal_type) { create(:animal_type) }

    it "updates the resource" do
      expect(AnimalTypeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { AnimalType.count }.by(-1)
      expect { animal_type.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
