require 'rails_helper'

RSpec.describe "animals#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/animals/#{animal.id}"
  end

  describe 'basic destroy' do
    let!(:animal) { create(:animal) }

    it 'updates the resource' do
      expect(AnimalResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Animal.count }.by(-1)
      expect { animal.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
