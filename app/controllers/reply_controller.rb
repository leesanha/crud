class ReplyController < ApplicationController
  def create
    @reply = Reply.new
    @reply.content = params[:content]
    # 해당 글의 id값을 post_id의 변수로 넣어준다.
    @reply.user_id = current_user.id
    @reply.post_id = params[:post_id]
    @reply.save
    
    # :back은 이전 화면으로 돌아가는 것
    redirect_to :back
  end

  def destroy
    @reply = Reply.find(params[:id])
    
    
    if currentuser_id == @reply.user_id
      @reply.destroy
    end
    redirect_to :back
  end
end
