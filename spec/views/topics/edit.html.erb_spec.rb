require 'spec_helper'

describe "topics/edit.html.erb" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
      :name => "MyString",
      :last_poster_id => 1
    ))
  end

  it "renders the edit topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => topics_path(@topic), :method => "post" do
      assert_select "input#topic_name", :name => "topic[name]"
      assert_select "input#topic_last_poster_id", :name => "topic[last_poster_id]"
    end
  end
end
