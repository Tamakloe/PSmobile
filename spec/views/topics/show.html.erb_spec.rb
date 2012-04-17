require 'spec_helper'

describe "topics/show.html.erb" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
      :name => "Name",
      :last_poster_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
