class AddThumbToPost < ActiveRecord::Migration
  def change
    add_column :posts, :thumb, :string
    add_column :posts, :middle, :string
  end
end