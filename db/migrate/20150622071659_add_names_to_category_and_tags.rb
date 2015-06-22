class AddNamesToCategoryAndTags < ActiveRecord::Migration
  def change
  	add_column :categories, :name, :string
  	add_column :tags, :name, :string
  end
end
