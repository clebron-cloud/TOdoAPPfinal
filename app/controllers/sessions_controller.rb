# Added comments for explanation
class SessionsController < ApplicationController
  # Displays the form
  def new; end

  # Creates a new record
  def create
    user = User.find_by(username: params[:username]) || User.find_by(email: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to todos_path, notice: "Logged in successfully."
    else
      flash.now[:alert] = "Invalid username/email or password."
      render :new, status: :unprocessable_entity
    end
  end

  # Deletes the record
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully."
  end
end