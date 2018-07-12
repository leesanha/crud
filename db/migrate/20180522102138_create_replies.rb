class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :content
      
      # 이대로 꼭 써야한다. 모델명_id
      t.integer :post_id
      t.integer :user_id
      
      # 요즘에는 t.belongs_to :post 이렇게 씀

      t.timestamps null: false
    end
  end
end
