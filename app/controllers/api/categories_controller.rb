module Api
	class CategoriesController < ApplicationController

		protect_from_forgery with: :null_session

    # expose the list of categories at /api/categories
		def index

			@categories = Category.all
			render json: @categories
    end

    # expose the hastags for each category /api/categories/<category_id>
		def show

			category = Category.find(params[:id])
			tags = category.tags.order(rank: :desc).limit(15)
			render json: tags
		end

    # for each Category, get the hashtag ranking and save it to the db
		def rank_tags

      category = Category.all

      category.each do |c|
          save_tags(get_ranking(c['name']))
      end

			redirect_to dashboard_path
		end

private

    # expects a category name from the Categories table
    # returns a single key/value pair
    # key is the category_id
    # value is an array with the rank and hashtag
    def get_ranking(category)

      category_tags = get_categories(Label, category)
      rank = get_tag_rank(category_tags)
      determine_winners(rank, category)
    end

    # expects a category name and the label table
    # returns an array of two item arrays with probability and hashtag - e.g. [[1.297, "#hashtag"], ...]
    def get_categories(label_table, category)

      #only get hashtags with a monkeylearn probability greater than 20%
      cat = label_table.connection.execute("SELECT * FROM Labels WHERE label='#{category}' and probability>=0.200;")
      cat_tags = {}

      #convert the psql string 'array' to a true array
      cat.each do |t|

        cat_tags.merge!(t['probability'].to_f => t['hashtag'].gsub("{","").gsub("}","").split(","))
      end

      #make all the hashtags lowercase
      cat_tags.each do |key, value|

        value.each do |v|
          v.downcase!
        end

      end

      cat_tags_sep = []

      #associate each hashtag with a probability as a two item array
      cat_tags.each do |key, value|

        value.each do |v|

          cat_tags_sep << "#{key},#{v}".split(",")
        end
      end

      cat_tags_sep_final = []

      #convert the probability back to float
      cat_tags_sep.each do |e|

        cat_tags_sep_final << [e[0].to_f, e[1]]
      end

      #return a two item array with probability and hashtag - e.g. [1.297, "#hashtag"]
      cat_tags_sep_final
    end

    # rank the tags by how often they appear and the monkeylearn probability
    # expects an array of two item arrays e.g. [[0.297, "#hashtag"], ...]
    # returns an array of three item arrays each containing the probability, hashtag, and rank
    # e.g. [[0.297, "#hashtag", 0.594], ...]
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
				 tag_array << tag_count
         ranked_hashtags << tag_array
       end

			 eliminate_tag_dups(ranked_hashtags)
    end

		# remove tags that appear more than once
		def eliminate_tag_dups(ranked_hashtags)
			dups_array = []
			ranked_hashtags.each do |ranked_tag_array|
				if ranked_tag_array[3] > 1
					dups_array << ranked_tag_array
				end
			end
			if dups_array.length > 1
				tag_rank = []
				dups_array.each do |arr|
					tag_rank << arr[2]
				end
				max_index_val = tag_rank.index(tag_rank.max)
				tag_to_use = dups_array[max_index_val]
				no_dups = ranked_hashtags - dups_array
				ranked_tags_no_dups = no_dups << tag_to_use
				return ranked_tags_no_dups
			else
				return ranked_hashtags
			end
		end

    # convert the category name to a cateogry_id
    # allow hashtags through that have a rank of 0.35 or higher
    # expects an array of three item arrays each containing the probability, hashtag, and rank
    # returns an a hash with the category_id (key), and a two item array with the hashtag and rank (value)
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

         if t[2] >=0.35

           cat_winners << [t[1], t[2]]
         end
       end

       winners = {category_id => cat_winners }
     end

    # expects a hash with the category_id (key), and a two item array with the hashtag and rank (value)
    # save hashtags and their rank to the Categories table
    def save_tags(winners)

      winners.each do |key, value|

        if value.length > 0

          value.each do |v|

            @category = Category.find(key)
            @category.tags << Tag.create( :name => v[0], :category_id => key, :rank => v[1])
          end

        else

          puts "category #{key} has no tags"
        end
      end
    end
	end
end
