class HomeController < ApplicationController

  def show
    redirect_to :welcome unless user_signed_in?
  end

  def welcome
    redirect_to root_path if user_signed_in?
    # welcome page. Sign in with all sorts of shizz
  end

end
