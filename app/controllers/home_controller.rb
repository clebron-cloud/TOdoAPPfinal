# Added comments for explanation
class HomeController < ApplicationController
  # Shows all records
  def index
    if logged_in?
      @todos_count = current_user.todos.count
      @completed_count = current_user.todos.where(completed: true).count
      @categories_count = current_user.categories.count
    end
  end
end