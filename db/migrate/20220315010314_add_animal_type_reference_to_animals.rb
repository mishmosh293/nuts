class AddAnimalTypeReferenceToAnimals < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :animals, :animal_types
    add_index :animals, :animal_type_id
    change_column_null :animals, :animal_type_id, false
  end
end
