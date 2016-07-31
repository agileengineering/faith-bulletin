class PagesController < ApplicationController
  def home
    @q = params[:q]
    @groups = Group.contains(@q).order(:title)
  end
end

