class HomeController < ApplicationController
  before_action :redirect_unlogged_users, only: [ :index ]
  def index
  end

  private

  def redirect_unlogged_users
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end
end
