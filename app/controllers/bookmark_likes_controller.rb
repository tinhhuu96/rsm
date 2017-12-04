class BookmarkLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @bookmark_like = current_user.bookmark_likes.new bookmark_like_params
    respond_to do |format|
      if @bookmark_like.save
        format.js{flash[:success] = t "bookmark_like.create"}
      else
        format.js
      end
    end
  end

  def bookmark_like_params
    params.require(:bookmark_like).permit :user_id, :job_id, :bookmark
  end
end
