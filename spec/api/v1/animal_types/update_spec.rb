require 'rails_helper'

RSpec.describe "animal_types#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/animal_types/#{animal_type.id}", payload
  end

  describe 'basic update' do
    let!(:animal_type) { create(:animal_type) }

    let(:payload) do
      {
        data: {
          id: animal_type.id.to_s,
          type: 'animal_types',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(AnimalTypeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { animal_type.reload.attributes }
    end
  end
end
