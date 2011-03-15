class FriendMailer < ActionMailer::Base
  default :from => "272partymanager@gmail.com"
  
  def new_friend_msg(friend)
  	@friend = friend
  	mail(:to => friend.email, :subject => "My new friend")
  end
  
  def remove_friend_msg(friend)
  	@friend = friend
  	mail(:to => friend.email, :subject => "You are no longer my friend")
  end
end
