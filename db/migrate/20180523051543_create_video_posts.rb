class CreateVideoPosts < ActiveRecord::Migration
  def change
    create_table :video_posts do |t|
      t.string :title
      t.string :video

      t.timestamps null: false
    end
  end
end
