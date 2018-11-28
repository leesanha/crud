class Post < ActiveRecord::Base
    # mount_uploader :image, ImageUploader
    # has_many의 값으로 reply는 복수가 와야됨. rails는 이를 구분한다.
    
    
    has_many :replies
    belongs_to :user
    
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    # 구문법
    # has_many :liked_users, :through => likes
    
    # title이 없으면 글 작성이 안됨.
    validates :title, presence: true, length: {minimum: 2}
end