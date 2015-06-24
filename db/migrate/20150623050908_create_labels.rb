class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.integer :tweet_id
      t.string :label
      t.float :probability
      t.string :hashtag, array:true, default:[]
      t.integer :count

      t.timestamps null: false
    end
  end
end
