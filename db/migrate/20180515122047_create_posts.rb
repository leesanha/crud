class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      # default는 사진을 올리지 않고, 글만 썼을 때 오류나지 않게 하는 것.
      t.string :image, default: ""
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

# rake db:drop db:migrate로 치면 된다.