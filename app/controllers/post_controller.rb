class PostController < ApplicationController
  # 로그인 인증을 거치게 하는 코드, 로그인이 필요없는 액션만 골라낸다. 여러개면 대괄호로 묶어준다.
  # 원하는 걸 하려면 except: 대신에 only:를 쓰면된다.
  before_action :authenticate_user!, except: [:index, :search, :show]
  
  def index
    @post = Post.all
    @posts = Post.order("created_at DESC").page(params[:page]).per(5)
    # @post = Post.all.reverse라고 적으면 최신순으로 게시될 것.
  end

  def new
  end

  def create
    # 사진을 저장하는 과정
    uploader = ImageUploader.new
    # new.html의 input에 name이 image임 그거랑 맞춰준다.
    uploader.store!(params[:image])
    
    @post = Post.new
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    # 글쓸 때 유저네임을 저장한다.
    @post.user_id = current_user.id
    # 사진의 주소를 저장
    @post.image = uploader.url
    @post.thumb = uploader.thumb.url
    @post.middle = uploader.middle.url
    @post.save
    # redirect_to 뒤에는 쌍따옴표로 두자
    #밑에 주소 이동을 주석처리하고 실행시키면, create.html파일이 뜨는데, 주소를 보면 params값이 날라오는 것을 볼 수 있음.
    redirect_to  "/post/index"
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.save
    
    redirect_to  "/post/show/#{params[:id]}"
    # redirect_to  "/post/show/" + params[:id]로 해도 된다.
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    
    # user_id가 1번이면 다 통과할 수 있도록 하면 administrator가 된다.
    # 글 작성자만 지울 수 글을 지울 수 있도록 만든다.
    if current_user.id == @post.user_id
      @post.destroy
      redirect_to "/post/index"
    else
      redirect_to "/post/index"
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_all = Post.all
    
    # 현재 show에 나오는 글의 id
    current_index = @post_all.index { |h| h[:id] == @post.id }
  
    @max_index = @post_all.length - 1
    if current_index == 0 
      @predecessor = -1
    else
      @predecessor = current_index - 1
      @post_all.each_with_index do |p, index|
        if index == @predecessor
          @predecessor_post_id = p.id
          @predecessor_post_title = p.title
        end
      end
    end
    if @max_index == current_index
      @successor = -1
    else  
      @successor = current_index + 1
      @post_all.each_with_index do |p, index|
        if index == @successor
          @successor_post_id = p.id
          @successor_post_title = p.title
        end
      end
    end
  end
  
  def search
    # Post.where(:title => "asdasd") #완전히 똑같은 것만 검색함
    category = params[:category]
    if category == "title"
      @post = Post.where("title LIKE ?", "%#{params[:q]}%") #title은 column명
    elsif category == "content"
      @post = Post.where("content LIKE ?", "%#{params[:q]}%")
    elsif category == "titleContent"
      @post = Post.where("title LIKE ? OR content LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    elsif category == "user"
      @post = User.where("username LIKE ?", "%#{params[:q]}%").take.posts
    end
  end
  
  def ajaxCall
    count = params[:count].to_i
    @item = Post.all.at(count)
    @return_value = {
      "id" => @item.id, 
      "username" => @item.user_id, 
      "title" => @item.title, 
      "time" => @item.created_at
    }
    render json: @return_value
  end
end
