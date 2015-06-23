class Category < ActiveRecord::Base
	has_many :category_tags
	has_many :tags, through: :category_tags
end
