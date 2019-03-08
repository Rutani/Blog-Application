module ApplicationHelper
	def mycount
		Notification.where(read:false, user:current_user).count
	end
	def like_exist
       Like.where(user_id: current_user , blog_id: @blog).present?
  	end
end
