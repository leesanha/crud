class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      # 구문법
      t.integer :user_id
      t.integer :post_id
      
      # 신문법
      # t.belongs_to :user 
      # t.belongs_to :post

      t.timestamps null: false
    end
  end
end
