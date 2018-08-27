class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @users = policy_scope(User)
    if params[:query].present?
      @users = User.search_by_first_name_and_last_name(params[:query])
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
    # @user = current_user
    authorize @user
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :show
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo, :photo_cache, :email)
  end
end
