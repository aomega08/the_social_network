class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post = Post.new
  end

  def about
    @user = User.find(params[:id])
  end

  def friend
    @user = User.find(params[:id])
    
    if current_user.has_received_friend_request? @user
      FriendshipRequest.where(user: @user, target: current_user).first.accept!
    else
      FriendshipRequest.create(user: current_user, target: @user)
    end
    
    redirect_to profile_url(@user)
  end

  def unfriend
    @user = User.find(params[:id])

    if current_user.has_friend? @user
      Friendship.delete_link current_user, @user
    elsif current_user.has_friend_request? @user
      FriendshipRequest.where(user: current_user, target: @user).first.destroy
    end

    redirect_to profile_url(@user)
  end
end
