class UsersController < ApplicationController
  # include SessionsHelper    ## for bhai ka method, edit me...
  before_action :logged_in_user, only: [:edit, :update, :index]
  before_action :correct_user, only:  [:edit, :update]

  def show
    @user = User.find(params[:id])
    # debugger          # works as debug pt. execution stops here, in server press ctrl-d and remove this line to continue
  end

  def index
    @users = User.paginate(page: params[:page])
    # @users = User.all
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

  def edit
    ## bhai ka method below...😎😎

    # curr = current_user
    # if curr != nil && curr.id == params[:id].to_i
    #   @user = User.find(params[:id])
    # elsif curr == nil
    #   flash[:danger] = "Please LogIn"
    #   redirect_to login_path
    # else
    #   # flash[:danger] = "not accessible"
    #   redirect_to root_path
    # end

    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please LogIn"
      redirect_to login_path
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless @user == current_user
  end
end
