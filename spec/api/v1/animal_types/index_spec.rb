require "rails_helper"

RSpec.describe "animal_types#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/animal_types", params: params
  end

  describe "basic fetch" do
    let!(:animal_type1) { create(:animal_type) }
    let!(:animal_type2) { create(:animal_type) }

    it "works" do
      expect(AnimalTypeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["animal_types"])
      expect(d.map(&:id)).to match_array([animal_type1.id, animal_type2.id])
    end
  end
end
