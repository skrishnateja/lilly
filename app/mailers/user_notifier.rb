class UserNotifier < ApplicationMailer
	def friend_requested(user_friendship_id)
		user_friendship UserFriendship.find(user_friendship_id)
		@user = user_friendship.user
		@friend = user_friendship.friend

		mail to: @friend.email
		subject: "#{@user.first_name} sent you a request"
	end
	def friend_requested(user_friendship_id)
		user_friendship UserFriendship.find(user_friendship_id)
		@user = user_friendship.user
		@friend = user_friendship.friend

		mail to: @user.email
		subject: "#{@friend.first_name} accepted you a request"
	end
end
