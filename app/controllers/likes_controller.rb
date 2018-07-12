class LikesController < ApplicationController
    def likes_toggle
        # puts "asdfasfasdfasdfasdfasdfasdfasd #{params[:post_id]}"
       like = Like.find_by(user_id: current_user.id, post_id: params[:id]) 
       
       if like.nil?
           Like.create(user_id: current_user.id, post_id: params[:id])
        
        #   위의 한 줄과 똑같다.
        #   @likes = Like.new
        #   @likes.user_id = current_user.id
        #   @likes.post_id = params[:id]
        #   @likes.save
       else
           like.destroy
       end
       
       redirect_to :back
    end
end
