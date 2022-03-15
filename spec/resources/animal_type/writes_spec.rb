require 'rails_helper'

RSpec.describe AnimalTypeResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'animal_types',
          attributes: { }
        }
      }
    end

    let(:instance) do
      AnimalTypeResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { AnimalType.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:animal_type) { create(:animal_type) }

    let(:payload) do
      {
        data: {
          id: animal_type.id.to_s,
          type: 'animal_types',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      AnimalTypeResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { animal_type.reload.updated_at }
      # .and change { animal_type.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:animal_type) { create(:animal_type) }

    let(:instance) do
      AnimalTypeResource.find(id: animal_type.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { AnimalType.count }.by(-1)
    end
  end
end