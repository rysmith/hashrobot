require 'rails_helper'

RSpec.describe LabelsController, :type => :controller do

  it 'should get the labels index view via controller action' do

    get :index

    expect(response).to have_http_status(:success)
    expect(response).to render_template(:index)
  end

end

RSpec.describe "Routes for labels", :type => :routing do
  it "routes /index to the labels controller" do
    expect(:get => "/labels/index").
        to route_to(:controller => "labels", :action => "index")
  end
end