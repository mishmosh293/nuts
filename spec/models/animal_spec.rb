require "rails_helper"

RSpec.describe Animal, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:animal_type) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it {
      should validate_numericality_of(:age).is_greater_than_or_equal_to(0)
    }
  end
end
