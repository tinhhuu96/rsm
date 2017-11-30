class ClubsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :club_params

  def create
    respond_to do |format|
      @club = current_user.clubs.new club_params
      if @club.save
        format.js{flash[:success] = t ".create_success"}
      else
        format.js{flash[:danger] = t ".create_fail"}
      end
    end
  end


  def update
    respond_to do |format|
      if @club.update_attributes club_params
        format.js{flash[:success] = t ".update_success"}
      else
        format.js{flash[:danger] = t ".update_fail"}
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

  def club_params
    club_param = params.require(:club).permit :name, :content, :current, :start_time, :end_time,
      :position, :user_id
  end
end
