class AnimalTypesController < ApplicationController
  before_action :set_animal_type, only: [:show, :edit, :update, :destroy]

  # GET /animal_types
  def index
    @animal_types = AnimalType.all
  end

  # GET /animal_types/1
  def show
    @animal = Animal.new
  end

  # GET /animal_types/new
  def new
    @animal_type = AnimalType.new
  end

  # GET /animal_types/1/edit
  def edit
  end

  # POST /animal_types
  def create
    @animal_type = AnimalType.new(animal_type_params)

    if @animal_type.save
      redirect_to @animal_type, notice: 'Animal type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /animal_types/1
  def update
    if @animal_type.update(animal_type_params)
      redirect_to @animal_type, notice: 'Animal type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /animal_types/1
  def destroy
    @animal_type.destroy
    redirect_to animal_types_url, notice: 'Animal type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal_type
      @animal_type = AnimalType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def animal_type_params
      params.require(:animal_type).permit(:name, :description)
    end
end
