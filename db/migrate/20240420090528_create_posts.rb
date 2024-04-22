class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.bigint :user_id, null: false
      t.text :introduction

      t.timestamps
    end
  end
end
