class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :get_recipes, :only =>[:new, :edit, :create, :update]

  # GET /recipes
  # GET /recipes.json
  def index
    @categories = Category.all
    @title = 'Categories'
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @title = 'Categories'
    @recipes = @category.recipes.each{|c| [c.name, c.id] }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
    
    def get_recipes
      @recipes = Recipe.all.collect{|c| [c.name, c.id] }
    end
end