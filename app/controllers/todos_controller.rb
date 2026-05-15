# Added comments for explanation
class TodosController < ApplicationController
  before_action :require_login
  before_action :set_todo, only: %i[show edit update destroy]

  # Shows all records
  def index
    @todos = current_user.todos.includes(:category).order(created_at: :desc)
  end

  def completed
    @todos = current_user.todos.includes(:category).where(completed: true).order(updated_at: :desc)
  end

  # Shows one record
  def show; end

  # Displays the form
  def new
    @todo = current_user.todos.new
  end

  # Creates a new record
  def create
    @todo = current_user.todos.new(todo_params)
    if @todo.save
      redirect_to @todo, notice: "ToDo created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Displays the edit form
  def edit; end

  # Updates the record
  def update
    if @todo.update(todo_params)
      redirect_to @todo, notice: "ToDo updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Deletes the record
  def destroy
    @todo.destroy
    redirect_to todos_path, notice: "ToDo deleted."
  end

  private

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :priority, :completed, :category_id)
  end
end