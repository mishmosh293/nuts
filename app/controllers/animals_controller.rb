class AnimalsController < ApplicationController
  before_action :set_animal, only: %i[show edit update destroy]

  def index
    @q = Animal.ransack(params[:q])
    @animals = @q.result(distinct: true).includes(:animal_type).page(params[:page]).per(10)
  end

  def show; end

  def new
    @animal = Animal.new
  end

  def edit; end

  def create
    @animal = Animal.new(animal_params)

    if @animal.save
      message = "Animal was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @animal, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @animal.update(animal_params)
      redirect_to @animal, notice: "Animal was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @animal.destroy
    message = "Animal was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to animals_url, notice: message
    end
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:animal_type_id, :photo, :name,
                                   :description, :age)
  end
end
