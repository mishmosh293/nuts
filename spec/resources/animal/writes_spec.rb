require 'rails_helper'

RSpec.describe AnimalResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'animals',
          attributes: { }
        }
      }
    end

    let(:instance) do
      AnimalResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Animal.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:animal) { create(:animal) }

    let(:payload) do
      {
        data: {
          id: animal.id.to_s,
          type: 'animals',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      AnimalResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { animal.reload.updated_at }
      # .and change { animal.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:animal) { create(:animal) }

    let(:instance) do
      AnimalResource.find(id: animal.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Animal.count }.by(-1)
    end
  end
end
