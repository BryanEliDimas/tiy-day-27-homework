class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))  # Get the params from the form
    if @user.save
      # Store the session!
      session[:current_user_id] = @user.id
      # Logged in, so go back to root path!
      redirect_to root_path
    else
      # Otherwise, if @user did not save (failed to sign up for some reason)
      # Render the form again :/
      render :new
    end
  end
end
