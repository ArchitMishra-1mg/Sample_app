class SessionsController < ApplicationController
  def new
    #@session1 = nil
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_back_or user
    else
      # Create an error message.
      flash.now[:danger] = "wrong email & pw combo"
      render 'new'

      # flash[:danger] = "wrong email & pw combo"      ##  @ Mayank why doesnt this works??
      # redirect_to self.new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
