class AnimalResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :animal_type_id, :integer
  attribute :photo, :string
  attribute :name, :string
  attribute :description, :string
  attribute :age, :integer

  # Direct associations

  # Indirect associations

end
