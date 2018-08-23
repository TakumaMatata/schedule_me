class UsersController < ApplicationController

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
    @user = User.find(user_params[:id])
    authorize @user
    if user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:id, :first_name, :last_name)
  end
end
