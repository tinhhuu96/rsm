class BookmarkLike < ApplicationRecord
  belongs_to :user
  belongs_to :job
  enum bookmark: [:bookmark, :like]
end
