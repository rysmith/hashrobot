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

  it 'should get the dashboard page' do

    get :dashboard

    expect(response).to have_http_status(:success)
    expect(response).to render_template(:dashboard)

  end

end

RSpec.describe "Routes for pages about", :type => :routing do
  it "routes /about to the pages controller" do
    expect(:get => "/pages/about").
        to route_to(:controller => "pages", :action => "about")
  end
end

RSpec.describe "Routes for pages index", :type => :routing do
  it "routes /index to the pages controller" do
    expect(:get => "/pages/index").
        to route_to(:controller => "pages", :action => "index")
  end
end


RSpec.describe "Routes for pages dashboard", :type => :routing do
  it "routes /dashboard to the pages controller" do
    expect(:get => "/pages/dashboard").
        to route_to(:controller => "pages", :action => "dashboard")
  end
end


