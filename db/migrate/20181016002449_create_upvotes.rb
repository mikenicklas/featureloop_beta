class CreateUpvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :upvotes do |t|
      t.integer :user_id
      t.integer :feature_id

      t.timestamps
    end
  end
end
