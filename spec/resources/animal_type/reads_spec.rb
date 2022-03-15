require "rails_helper"

RSpec.describe AnimalTypeResource, type: :resource do
  describe "serialization" do
    let!(:animal_type) { create(:animal_type) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(animal_type.id)
      expect(data.jsonapi_type).to eq("animal_types")
    end
  end

  describe "filtering" do
    let!(:animal_type1) { create(:animal_type) }
    let!(:animal_type2) { create(:animal_type) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: animal_type2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([animal_type2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:animal_type1) { create(:animal_type) }
      let!(:animal_type2) { create(:animal_type) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      animal_type1.id,
                                      animal_type2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      animal_type2.id,
                                      animal_type1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
