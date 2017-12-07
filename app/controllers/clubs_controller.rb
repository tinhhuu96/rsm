class ClubsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :params_club

  def create
    respond_to do |format|
      if @club.save
        format.js{@message = t ".create_success"}
      else
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @club.update_attributes params_club
        format.js{@message = t ".update_success"}
      else
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @club.destroy
        format.js{@message_success = t ".destroy_success"}
      else
        format.js{@message_failed = t ".destroy_fail"}
      end
    end
  end

  private

  def params_club
    params.require(:club).permit :name, :content, :current, :start_time, :end_time,
      :position, :user_id
  end
end
