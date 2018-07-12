class VideoBoardController < ApplicationController
  def index
    @video = VideoPost.all
  end

  def new
  end

  def create
    @video = VideoPost.new
    @video.title = params[:input_title]
    @video.video = params[:input_content]
    # 사진의 주소를 저장

    @video.save
    # redirect_to 뒤에는 쌍따옴표로 두자
    #밑에 주소 이동을 주석처리하고 실행시키면, create.html파일이 뜨는데, 주소를 보면 params값이 날라오는 것을 볼 수 있음.
    redirect_to  "/video_board/index"
  end

  def update
  end

  def edit
    @video = VideoPost.find(params[:id])
  end

  def destroy
    @video = VideoPost.find(params[:id])
    @video.destroy
    
    redirect_to "/video_board/index"
  end

  def show
    @video = VideoPost.find(params[:id])
    @video_post_all = VideoPost.all
    
    # 현재 show에 나오는 글의 id
    current_index = @video_post_all.index { |h| h[:id] == @video.id }
  
    @max_index = @video_post_all.length - 1
    if current_index == 0 
      @predecessor = -1
    else
      @predecessor = current_index - 1
      @video_post_all.each_with_index do |p, index|
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
      @video_post_all.each_with_index do |p, index|
        if index == @successor
          @successor_post_id = p.id
          @successor_post_title = p.title
        end
      end
    end
  end
end
