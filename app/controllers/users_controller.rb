class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))  # Get the params from the form
    if @user.save
      # Store the session!
      session[:current_user_id] = @user.id
      # Logged in, just flash success message
      redirect_to root_path, notice: "You're signed UP! 😀"
    else
      # Otherwise, if @user did not save (failed to sign up for some reason)
      # Render the form again :/
      render :new
    end
  end
end
