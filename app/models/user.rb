class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :posts 
  has_many :replies
  
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  
  
  def is_like?(post)
    # find 메소드는 무조건 id값으로 찾음
    Like.find_by(user_id: self.id, post_id: post.id).present?
    # find는 하나만 결과로 나타남, where로 해야 여러개가 결과값으로 나옴
  end
end

