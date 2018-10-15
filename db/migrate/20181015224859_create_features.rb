class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
