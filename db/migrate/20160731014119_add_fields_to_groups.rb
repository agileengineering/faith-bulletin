class AddFieldsToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :tagline,           :string
    add_column :groups, :address,           :text
    add_column :groups, :website_url,       :string
    add_column :groups, :facebook_page_url, :string
    add_column :groups, :twitter_handle,    :string
    add_column :groups, :instagram_handle,  :string
  end
end
