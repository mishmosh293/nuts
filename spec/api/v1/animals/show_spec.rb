require 'rails_helper'

RSpec.describe "animals#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/animals/#{animal.id}", params: params
  end

  describe 'basic fetch' do
    let!(:animal) { create(:animal) }

    it 'works' do
      expect(AnimalResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('animals')
      expect(d.id).to eq(animal.id)
    end
  end
end
