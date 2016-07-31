class GroupsController < ApplicationController

  def index
    if current_user
      @groups = current_user.groups.order('title asc')
    else
      redirect_to root_path
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      @group.make_owner(current_user)
      redirect_to groups_path, notice: 'Group successfully created.'
    else
      render action: 'index', alert: 'There was a problem saving the group.'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      redirect_to groups_path, notice: 'Group successfully updated.'
    else
      render action: 'edit', alert: 'There was a problem saving the group.'
    end
  end

private

  def group_params
    params.require(:group).permit(
      :title,
      :description,
      :tagline,
      :address,
      :website_url,
      :facebook_page_url,
      :twitter_handle,
      :instagram_handle,
      :profile_pic
    )
  end
end
