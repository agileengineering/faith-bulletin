class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text   :description
      t.datetime :deadline
      t.references :user
    end
    add_foreign_key :tasks, :users
  end
end

