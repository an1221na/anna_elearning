class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @activities = Activity.where("user_id IN (?) OR user_id = ?", current_user.following_ids, current_user.id)
      # １個目の？はcurrent_user.following_ids、２個目の？はcurrent_user.id
      # 大人数の中からuser_idがいる場合には、INを使う。
      render "users/home_feed"
    end
  end

  def about
  end

end
