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

		def rank_tags
			print get_categories(Label)
			redirect_to new_label_path
		end

		def update
			
		end
		def destroy
			
		end
private
	def get_categories(label_table)
		ent = label_table.connection.execute("SELECT * FROM Labels WHERE label='Entertainment & Recreation' and probability>=0.200;")
		ent_tags = {}
		ent.each do |t|
			ent_tags.merge!(t['hashtag'].gsub("{","").gsub("}","").split(",") => t['probability'].to_f + 1)
    end

    ent_tags_sep = []

    ent_tags.each do |key, value|

      key.each do |k|

        ent_tags_sep << "#{k},#{value}".split(",")
      end
    end

    ent_tags_sep_final = []
    ent_tags_sep.each do |e|

      ent_tags_sep_final << [e[0], e[1].to_f]
    end

    ent_tags_sep_final
    
	end

	end
end