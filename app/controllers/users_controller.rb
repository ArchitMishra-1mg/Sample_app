class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # debugger          # works as debug pt. execution stops here, press ctrl-d and remove this line to continue
  end

  def new
    @user = User.new
  end

  def create
  @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user     # also usable render 'show'
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
