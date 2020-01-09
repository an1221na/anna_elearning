class StaticPagesController < ApplicationController
  def home
    if signed_in?
      render "users/home_feed"
    end
  end

  def about
  end

end
