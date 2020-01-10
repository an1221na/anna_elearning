class RelationshipsController < ApplicationController
  def create
   
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    relationship = Relationship.find(params[:id])
    other_user = User.find(relationship.followed_id)
    relationship.destroy
    
    redirect_to other_user
  end
end
