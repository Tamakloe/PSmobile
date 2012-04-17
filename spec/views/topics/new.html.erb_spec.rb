require 'spec_helper'

describe "topics/new.html.erb" do
  before(:each) do
    assign(:topic, stub_model(Topic,
      :name => "MyString",
      :last_poster_id => 1
    ).as_new_record)
  end

  it "renders new topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => topics_path, :method => "post" do
      assert_select "input#topic_name", :name => "topic[name]"
      assert_select "input#topic_last_poster_id", :name => "topic[last_poster_id]"
    end
  end
end
