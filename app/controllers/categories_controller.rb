class CategoriesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    not_found unless current_user.groups.include? @group
    @categories   = @group.categories
    @new_category = Category.new
  end

  def create
    @group = Group.find(params[:group_id])
    not_found unless current_user.is_owner?(@group)

    @new_category = @group.categories.build(category_params)

    if @new_category.save
      redirect_to group_categories_path(@group), notice: 'Category successfully added.'
    else
      render action: 'index', alert: 'There was a problem adding the category to the group.'
    end
  end

private

  def category_params
    params.require(:category).permit(
      :title
    )
  end
end

