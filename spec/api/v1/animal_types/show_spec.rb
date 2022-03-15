require 'rails_helper'

RSpec.describe "animal_types#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/animal_types/#{animal_type.id}", params: params
  end

  describe 'basic fetch' do
    let!(:animal_type) { create(:animal_type) }

    it 'works' do
      expect(AnimalTypeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('animal_types')
      expect(d.id).to eq(animal_type.id)
    end
  end
end
