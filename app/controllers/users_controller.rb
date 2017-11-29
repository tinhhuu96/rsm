class UsersController < ApplicationController
  before_action :load_user, only: :show

  def show
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
