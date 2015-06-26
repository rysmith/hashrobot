module Api
	class CategoriesController < ApplicationController

		protect_from_forgery with: :null_session

		def index

			@categories = Category.all
			render json: @categories 
    end

		def show

			category = Category.find(params[:id])
			tags = category.tags
			render json: tags
		end

		def rank_tags

      category = Category.all

      category.each do |c|
          save_tags(get_ranking(c['name']))
      end

			redirect_to dashboard_path
		end

private

    def get_ranking(category)

      category_tags = get_categories(Label, category)
      rank = get_tag_rank(category_tags)
      determine_winners(rank, category)
    end

    def get_categories(label_table, category)

      cat = label_table.connection.execute("SELECT * FROM Labels WHERE label='#{category}' and probability>=0.200;")
      cat_tags = {}

      cat.each do |t|

        cat_tags.merge!(t['probability'].to_f + 1 => t['hashtag'].gsub("{","").gsub("}","").split(","))
      end

      cat_tags_sep = []

      cat_tags.each do |key, value|

        value.each do |v|

          cat_tags_sep << "#{key},#{v}".split(",")
        end
      end

      cat_tags_sep_final = []

      cat_tags_sep.each do |e|

        cat_tags_sep_final << [e[0].to_f, e[1]]
      end

      cat_tags_sep_final
    end

    def get_tag_rank(get_categories)

       ranked_hashtags = []

       get_categories.each do |tag_array|

         tag = tag_array[1]
         tag_count = 0

         get_categories.each do |tag_array_nested|

           if tag == tag_array_nested[1]

             tag_count += 1
           end
         end

         tag_array << tag_count * tag_array[0]
         ranked_hashtags << tag_array
       end

       ranked_hashtags
     end

    def determine_winners(get_tag_rank, category)

      case category
        when "Animals"
          category_id = 1
        when "Beauty & Style"
          category_id = 2
        when "Business & Finance"
          category_id = 3
        when "Computers & Internet"
          category_id = 4
        when "Consumer Electronics"
          category_id = 5
        when "Education"
          category_id = 6
        when "Entertainment & Recreation"
          category_id = 7
        when "Environment"
          category_id = 8
        when "Food & Drink"
          category_id = 9
        when "Gardening"
          category_id = 10
        when "Health & Medicine"
          category_id = 11
        when "Home"
          category_id = 12
        when "Humanities"
          category_id = 13
        when "Science & Mathematics"
          category_id = 14
        when "Society"
          category_id = 15
        when "Travel"
          category_id = 16
      end

       cat_winners = []

       get_tag_rank.each do |t|

         if t[2] >=1.35

           cat_winners << t[1]
         end
       end

       cat_winners = {category_id => cat_winners }
     end

    def save_tags(winners)

      winners.each do |key, value|

        if value.length > 0

          value.each do |v|

            @category = Category.find(key)
            @category.tags << Tag.create( :name => v, :category_id => key)
          end

        else

          puts "category #{key} has no tags"
        end
      end
    end
	end
end