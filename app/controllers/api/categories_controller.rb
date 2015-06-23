module Api
	class CategoriesController < ApplicationController
		protect_from_forgery with: :null_session

		def index
			# categories = { categories: ['Home', 'Entertainment', 'Pets'] }
			@categories = Category.all
			render json: @categories 
		end
		def show
			# tags = case params[:id]
			# 	when 'Home'
			# 	{ tags: ['#gardening', '#decor', '#kitchen'] }
			# 	when 'Entertainment'
			# 	{ tags: ['#celebrities', '#music', '#movies'] }
			# 	when 'Pets'
			# 	{ tags: ['#dogs', '#cats', '#fish'] }
			# 	else
			# 	{ tags: ['#gardening', '#decor', '#kitchen'] }
			# 	end
			category = Category.find(params[:id])	 #(if we're doing it by id)
			# Category.where(name: params[:id]).first (if we're doing it by name)
			tags = category.tags
			render json: tags
		end
		def create
			
		end
		def update
			
		end
		def destroy
			
		end


	end
end