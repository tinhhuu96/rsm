class ClubsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_ability
  load_and_authorize_resource param_method: :params_club

  def create
    respond_to do |format|
      @club = current_user.clubs.new params_club
      if @club.save
        format.js{flash[:success] = t ".create_success"}
      else
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @club.update_attributes params_club
        format.js{flash[:success] = t ".update_success"}
      else
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @club.destroy
        format.js{flash[:success] = t ".destroy_success"}
      else
        format.js{flash[:danger] = t ".destroy_fail"}
      end
    end
  end

  private

  def params_club
    params.require(:club).permit :name, :content, :current, :start_time, :end_time,
      :position, :user_id
  end
end
