class CreateBookmarkLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmark_likes do |t|
      t.boolean :bookmark
      t.references :user, foreign_key: true
      t.references :job, foreign_key: true
      t.index [:user_id, :job_id, :bookmark], unique: true
      t.timestamps
    end
  end
end
