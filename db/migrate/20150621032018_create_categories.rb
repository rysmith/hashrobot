class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :tweet_id
      t.string :category
      t.float :probability
      t.string :hashtag
      t.integer :count

      t.timestamps null: false
    end
  end
end
