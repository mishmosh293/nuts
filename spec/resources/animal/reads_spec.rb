require 'rails_helper'

RSpec.describe AnimalResource, type: :resource do
  describe 'serialization' do
    let!(:animal) { create(:animal) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(animal.id)
      expect(data.jsonapi_type).to eq('animals')
    end
  end

  describe 'filtering' do
    let!(:animal1) { create(:animal) }
    let!(:animal2) { create(:animal) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: animal2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([animal2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:animal1) { create(:animal) }
      let!(:animal2) { create(:animal) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            animal1.id,
            animal2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            animal2.id,
            animal1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
