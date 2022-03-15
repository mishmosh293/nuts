class Api::V1::AnimalTypesController < Api::V1::GraphitiController
  def index
    animal_types = AnimalTypeResource.all(params)
    respond_with(animal_types)
  end

  def show
    animal_type = AnimalTypeResource.find(params)
    respond_with(animal_type)
  end

  def create
    animal_type = AnimalTypeResource.build(params)

    if animal_type.save
      render jsonapi: animal_type, status: :created
    else
      render jsonapi_errors: animal_type
    end
  end

  def update
    animal_type = AnimalTypeResource.find(params)

    if animal_type.update_attributes
      render jsonapi: animal_type
    else
      render jsonapi_errors: animal_type
    end
  end

  def destroy
    animal_type = AnimalTypeResource.find(params)

    if animal_type.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: animal_type
    end
  end
end
