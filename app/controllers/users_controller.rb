class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_ability
  load_and_authorize_resource param_method: :user_params

  def show
    @clubs = @user.clubs
    @achievements = @user.achievements
    @certificates = @user.certificates
    @experiences = @user.experiences
  end

  def update
    respond_to do |format|
      if @user.update_attributes user_params
        format.js{flash[:success] = t "users.new.update_success"}
      else
        format.js{flash[:danger] = t "users.new.update_fail"}
      end
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :birthday, :address, :phone
  end
end
