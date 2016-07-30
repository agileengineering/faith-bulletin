class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :title, null: false
      t.string :description
      t.timestamps
    end

    create_table :memberships do |t|
      t.references :group, null: false
      t.references :user,  null: false
      t.integer    :role,  null: false, default: 1
    end

    add_foreign_key :memberships, :groups
    add_foreign_key :memberships, :users
  end
end
