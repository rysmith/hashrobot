class AddRankToTags < ActiveRecord::Migration
  def change
    add_column :tags, :rank, :float
  end
end
