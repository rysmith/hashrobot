require 'rails_helper'

RSpec.describe Tweet, :type => :model do
	
	it "content should be string" do
		t = Tweet.new content: "string"
		expect(t.content == "string").to be true
	end
	
end