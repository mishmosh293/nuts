json.extract! animal, :id, :animal_type_id, :photo, :name, :description, :age,
              :created_at, :updated_at
json.url animal_url(animal, format: :json)
