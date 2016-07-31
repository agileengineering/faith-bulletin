class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :title, null: false
      t.references :group, null: false
    end

    add_column :tasks, :category_id, :integer, null: false
    add_foreign_key :tasks, :categories
    add_foreign_key :categories, :groups
  end
end
