require 'rails_helper'

RSpec.describe Category, :type => :model do
	
	describe "has_many relationship" do
  	it { should have_many(:category_tags) }
	end

	describe "has_many through relationship" do
		it { should have_many(:tags).through(:category_tags) }
	end

	it "name cannot be number" do
		c = Category.new name: 7
		expect(c.name == 7).to be false
	end
end