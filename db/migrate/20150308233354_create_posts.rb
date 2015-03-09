class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body, null: false
      t.belongs_to :user, index: true, null: false

      t.timestamps null: false
    end
  end
end
