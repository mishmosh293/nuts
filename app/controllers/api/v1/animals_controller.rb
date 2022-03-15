class Api::V1::AnimalsController < Api::V1::GraphitiController
  def index
    animals = AnimalResource.all(params)
    respond_with(animals)
  end

  def show
    animal = AnimalResource.find(params)
    respond_with(animal)
  end

  def create
    animal = AnimalResource.build(params)

    if animal.save
      render jsonapi: animal, status: 201
    else
      render jsonapi_errors: animal
    end
  end

  def update
    animal = AnimalResource.find(params)

    if animal.update_attributes
      render jsonapi: animal
    else
      render jsonapi_errors: animal
    end
  end

  def destroy
    animal = AnimalResource.find(params)

    if animal.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: animal
    end
  end
end
