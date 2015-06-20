require 'rails_helper'

RSpec.describe TweetsController, :type => :controller do
  it 'should get the tweets (index) page' do

    get :index

    expect(response).to have_http_status(:success)

    expect(response).to render_template(:index)
  end

  it 'should get the new tweet page' do

    get :new

    expect(response).to have_http_status(:success)

    expect(response).to render_template(:new)
  end
end
