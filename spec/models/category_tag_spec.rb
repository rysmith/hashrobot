require 'rails_helper'

RSpec.describe CategoryTag, :type => :model do
	
	describe "belongs_to category relationship" do
		it { should belong_to(:category) }	
	end

	describe "belongs_to tag relationship" do
		it { should belong_to(:tag) }
	end

	it "category_id cannot be a name" do
		c = CategoryTag.new category_id: "Home"
		expect(c.category_id == "Home").to be false
	end

	it "tag_id cannot be a name" do
		c = CategoryTag.new tag_id: "Home"
		expect(c.category_id == "Home").to be false
	end
end