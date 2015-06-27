require 'rails_helper'

RSpec.describe Tag, :type => :model do
	
	describe "has_many category_tag relationship" do
		it { should have_many(:category_tags) }
	end

	describe "has_many categories through category_tag relationship" do
		it { should have_many(:categories).through(:category_tags)}
	end

	it "category_id cannot be a name" do
		t = Tag.new category_id: "Home"
		expect(t.category_id == "Home").to be false
	end

	it "name cannot be number" do
		t = Tag.new name: 7
		expect(t.name == 7).to be false
	end

end