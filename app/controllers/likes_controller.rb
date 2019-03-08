class LikesController < ApplicationController
	 before_action :authenticate_user!
  def new
  		 @like = Like.new
  	end

	def create
      @blog = Blog.find(params[:blog_id])
      if Like.where(user_id: current_user.id , blog_id: @blog).present? 

       # flash[:danger]= "Already  Liked"
       redirect_to blog_path(@blog)
       return false
      else
      	@like = @blog.likes.create(user_id: current_user.id)
        # render json:Notification.create(:user => current_user, :blog => @blog, :notifiable=> @like) 
        # return
        if @blog.user_id != current_user.id
        Notification.create(:user_id => @blog.user_id, :blog => @blog, :notifiable=> @like,  :read=>false)
        end
        redirect_to blog_path(@blog)
        flash[:success]= " Liked"
        return true
     end
  	end
    def destroy
      @blog = Blog.find(params[:id])
      @like=Like.where(user_id: current_user.id , blog_id: @blog).take
      @like.destroy
      redirect_to  blog_path(@blog)
    end

  	def show
  		redirect_to blog_path(@blog)
  	end
  	def index
  	end
  
end
