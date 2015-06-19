require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

  it 'should get the welcome (index) page' do

    get :index

    expect(response).to have_http_status(:success)

    expect(response).to render_template(:index)
  end

  it 'should get the about page' do
    get :about

    expect(response).to have_http_status(:success)

    expect(response).to render_template(:about)
  end
end
