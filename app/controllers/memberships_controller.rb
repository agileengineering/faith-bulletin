class MembershipsController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    not_found unless current_user.groups.include? @group
    @memberships = @group.memberships
    @new_member  = Membership.new
  end

  def create
    @group = Group.find(params[:group_id])
    not_found unless current_user.is_owner?(@group)

    @new_member = @group.memberships.build(membership_params)

    if @new_member.save
      redirect_to group_memberships_path(@group), notice: 'Member successfully added.'
    else
      render action: 'edit', alert: 'There was a problem adding the member to the group.'
    end
  end

private

  def membership_params
    params.require(:membership).permit(
      :user_id,
      :role
    )
  end
end

