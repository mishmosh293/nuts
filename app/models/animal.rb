class Animal < ApplicationRecord
  mount_base64_uploader :photo, PhotoUploader

  # Direct associations

  belongs_to :animal_type

  # Indirect associations

  # Validations

  validates :age, numericality: { greater_than_or_equal_to: 0 }

  # Scopes

  def to_s
    animal_type.to_s
  end
end
