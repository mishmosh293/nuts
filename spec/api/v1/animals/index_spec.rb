require 'rails_helper'

RSpec.describe "animals#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/animals", params: params
  end

  describe 'basic fetch' do
    let!(:animal1) { create(:animal) }
    let!(:animal2) { create(:animal) }

    it 'works' do
      expect(AnimalResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['animals'])
      expect(d.map(&:id)).to match_array([animal1.id, animal2.id])
    end
  end
end
