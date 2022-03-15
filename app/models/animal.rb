class Animal < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :age, :numericality => { :greater_than_or_equal_to => 0 }

  # Scopes

  def to_s
    animal_type.to_s
  end

end
