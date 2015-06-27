require 'rails_helper'

RSpec.describe Label, :type => :model do

	it "tweet_id cannot be string" do
		l = Label.new tweet_id: "tweet"
		expect(l.tweet_id == "tweet").to be false
	end

	it "label cannot be integer" do
		l = Label.new label: 5
		expect(l.label == 5).to be false
	end

	it "probability is a float" do
		l = Label.new probability: 1.23
		expect(l.probability == 1.23).to be true
	end

	it "count is an integer" do
		l = Label.new count: 1
		expect(l.count == 1).to be true
	end
end
