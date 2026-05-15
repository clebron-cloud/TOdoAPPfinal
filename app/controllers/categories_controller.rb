# Added comments for explanation
class CategoriesController < ApplicationController
  before_action :require_login
  before_action :set_category, only: %i[show edit update destroy]

  # Shows all records
  def index
    @categories = current_user.categories.order(:name)
  end

  # Shows one record
  def show
    @todos = @category.todos.order(created_at: :desc)
  end

  # Displays the form
  def new
    @category = current_user.categories.new
  end

  # Creates a new record
  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      redirect_to @category, notice: "Category created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Displays the edit form
  def edit; end

  # Updates the record
  def update
    if @category.update(category_params)
      redirect_to @category, notice: "Category updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Deletes the record
  def destroy
    @category.destroy
    redirect_to categories_path, notice: "Category and its ToDos were deleted."
  end

  private

  def set_category
    @category = current_user.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end