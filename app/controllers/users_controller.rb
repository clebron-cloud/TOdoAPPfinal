# Added comments for explanation
class UsersController < ApplicationController
  # Displays the form
  def new
    @user = User.new
  end

  # Creates a new record
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to todos_path, notice: "Account created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Deletes the record
  def destroy
    if current_user && current_user.id == params[:id].to_i
      current_user.destroy
      session[:user_id] = nil
      redirect_to root_path, notice: "Your account was deleted."
    else
      redirect_to root_path, alert: "You cannot delete that account."
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end
end