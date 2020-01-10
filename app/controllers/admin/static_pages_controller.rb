class Admin::StaticPagesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user

  def home
  end
end
