class AnimalTypesController < ApplicationController
  before_action :set_animal_type, only: %i[show edit update destroy]

  def index
    @q = AnimalType.ransack(params[:q])
    @animal_types = @q.result(distinct: true).includes(:animals).page(params[:page]).per(10)
  end

  def show
    @animal = Animal.new
  end

  def new
    @animal_type = AnimalType.new
  end

  def edit; end

  def create
    @animal_type = AnimalType.new(animal_type_params)

    if @animal_type.save
      redirect_to @animal_type, notice: "Animal type was successfully created."
    else
      render :new
    end
  end

  def update
    if @animal_type.update(animal_type_params)
      redirect_to @animal_type, notice: "Animal type was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @animal_type.destroy
    redirect_to animal_types_url,
                notice: "Animal type was successfully destroyed."
  end

  private

  def set_animal_type
    @animal_type = AnimalType.find(params[:id])
  end

  def animal_type_params
    params.require(:animal_type).permit(:name, :description)
  end
end
