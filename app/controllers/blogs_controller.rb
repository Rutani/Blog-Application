class BlogsController < ApplicationController
 before_action :authenticate_user!,except: []
def new
  @blog = Blog.new
end
 
 def index
 	@blog=Blog.all
 end
 def destroy
 	  @blog = Blog.find(params[:id])
 	  @blog.destroy
 	  redirect_to blogs_path
 end
 def show 
 	@blog = Blog.find(params[:id])
  
 end
 def edit
   @blog = Blog.find(params[:id])
 end
  def update
 	@blog = Blog.find(params[:id])
 	if @blog.update(blog_params)
 		redirect_to @blog
 	else
 		render 'edit'
 	end
 end
def create
  @blog = Blog.new(blog_params.merge(:user_id=>current_user.id))
 
  if @blog.save
    redirect_to blog_path(@blog)
  else
    render 'new'
  end
end
def notification

  @notification= Notification.where("user_id=?",current_user.id).order(created_at: :desc)
  render 'notification'
  
end
def change_val

  @notification= Notification.find(params[:id])
  if @notification.read == false
    @notification.update(:read=>true)
    redirect_to blog_path(@notification.blog_id) 
  else
    redirect_to blogs_notification_path
  end
end
def myblog
  @blogs=Blog.where("user_id=?",current_user.id)
  render 'myblog'
end

private
  def blog_params
    params.require(:blog).permit(:title, :body)
  end

end
