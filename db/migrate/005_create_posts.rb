class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.text :body
      t.references :user
    end
  end
end
