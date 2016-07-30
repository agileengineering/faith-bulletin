class GroupsController < ApplicationController

  def index
    @groups = Group.order('title asc')
  end

  def new
    @group = Group.new
  end

end
