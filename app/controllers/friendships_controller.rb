class FriendshipsController < ApplicationController
  def create
    new_friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: new_friend.id)
    if current_user.save
      flash[:notice] = "You and #{new_friend.full_name} are friends now!"
    else
      flash[:alert] = "There was something wrong with the tracking request."
    end
    redirect_to my_friends_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = "Stopped following user: #{User.find(params[:id]).full_name}"
    redirect_to my_friends_path
  end
end
