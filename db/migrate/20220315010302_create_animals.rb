class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.integer :animal_type_id
      t.string :photo
      t.string :name
      t.string :description
      t.integer :age

      t.timestamps
    end
  end
end
