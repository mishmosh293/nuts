require "rails_helper"

RSpec.describe "animals#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/animals/#{animal.id}", payload
  end

  describe "basic update" do
    let!(:animal) { create(:animal) }

    let(:payload) do
      {
        data: {
          id: animal.id.to_s,
          type: "animals",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(AnimalResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { animal.reload.attributes }
    end
  end
end
