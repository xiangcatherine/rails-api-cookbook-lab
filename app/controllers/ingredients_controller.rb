class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[show destroy update]
  def index
    @ingredients = Ingredient.all
    render json: @ingredients
  end

  def show
    render json: @ingredient
  end

  def destroy
    @ingredient.destroy
    head :no_content
  end

  def update
    if @ingredient.update(ingredient_params)
      head :no_content
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      render json: @ingredient, status: :created
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :unit)
  end
end
