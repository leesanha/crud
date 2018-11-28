class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  
  has_many :posts 
  has_many :replies
  
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  
  
  def is_like?(post)
    # find 메소드는 무조건 id값으로 찾음
    Like.find_by(user_id: self.id, post_id: post.id).present?
    # find는 하나만 결과로 나타남, where로 해야 여러개가 결과값으로 나옴
  end
  
  def self.find_for_oauth(auth, signed_in_resource = nil)
    # user와 identity가 nil이 아니라면 받는다
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
 
    # user가 nil이라면 새로 만든다.
    if user.nil?
      # 이미 있는 이메일인지 확인한다.
      email = auth.info.email
      user = User.where(:email => email).first
      unless self.where(email: auth.info.email).exists?
        # 없다면 새로운 데이터를 생성한다.
        if user.nil?
          user = User.new(
            email: auth.info.email,
            profile_img: auth.info.image,
            password: Devise.friendly_token[0,20]
          )
          user.save!
        end
      end
    end
 
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end
 
  # email이 없어도 가입이 되도록 설정
 
  def email_required?
    false
  end
end

