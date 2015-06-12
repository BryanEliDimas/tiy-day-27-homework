class SessionController < ApplicationController
  def new
  end

  # To create a session means, just login.
  # Creating a user is signing up, handled separately as a new user.
  def create
    username = params[:username]
    password = params[:password]

    user = User.find_by username: username

    if (user) && (user.authenticate password) # If user exists and password is right
      # Store the user's id in a session variable
      session[:current_user_id] = user.id
      redirect_to root_path, notice: "You're in! 😀"
    else
      flash.now[:notice] = "Ooops. Try again."
      render :new
    end

  end

  def destroy
    session.delete :current_user_id # Removes the user's id from the current session
    redirect_to root_path
  end
end
