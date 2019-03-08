class CommentsController < ApplicationController
	 before_action :authenticate_user!
	def create
		@blog = Blog.find(params[:blog_id])
		@comment =@blog.comments.create(comment_params.merge(:user_id=>current_user.id))
		if @blog.user_id != current_user.id
		Notification.create(:user_id => @blog.user_id, :blog => @blog, :notifiable=> @comment, :read=>false)
	    end
	    redirect_to blog_path(@blog)
	end
	private
	def comment_params
		params.require(:comment).permit(:opinion)
	end
end
