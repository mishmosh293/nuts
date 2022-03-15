class ChangeDescriptionDefaultValueInAnimalTypes < ActiveRecord::Migration[6.0]
  def change
    change_column_default :animal_types, :description, "Animal"
  end
end
