class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update,:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]= @user.id
      flash[:notice] = "Hello #{@user[:username]} , Welcome to Alpha Blog."
      redirect_to @user
    else
      render "new"
    end
  end
  def edit
    # @user = User.find(params[:id])
  end
  def update
    # @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your account has been updated successfully."
      redirect_to @user
    else
      render "edit"
    end
  end
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end
  def index 
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    if current_user.admin?
      @user.destroy
      flash[:notice] ="Account and all associated articles successfully deleted"
      redirect_to user_path
    else
      @user.destroy
      session[:user_id]= nil if @user == current_user
      flash[:notice] ="Account and all associated articles successfully deleted"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only edit your own account."
      redirect_to @user
    end
  end
end