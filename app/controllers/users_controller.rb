class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user, only: :show

  def show
    @clubs = @user.clubs
    @achievements = @user.achievements
    @certificates = @user.certificates
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:warning] = t "users_controller.errorss"
    redirect_to root_path
  end
end
