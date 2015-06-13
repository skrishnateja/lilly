class UserFriendshipsController < ApplicationController
	before_filter :authenticate_user!
  
  def index
  	
  end
  	def new
		if params[:friend_id]
			@friend = User.find(params[:friend_id])
			@user_friendship = current_user.user_friendships.new(friend: @friend)
		else
			flash[:error] = "friend required"
		end	
	rescue ActiveRecord::RecordNotFound
		render file: 'public/404', status: :not_found
	end
	def create
    if params[:user_friendship] && params[:user_friendship].has_key?(:friend_id)
      @friend = User.where(profile_name: params[:user_friendship][:friend_id]).first
      @user_friendship = current_user.user_friendships.new(friend: @friend)
     	@user_friendship.save
     	flash[:success] = "Friend added"
     	redirect_to profile_path(@friend.profile_name)
    else
      flash[:error] = "Friend required"
      redirect_to root_path
    end
  end

end
