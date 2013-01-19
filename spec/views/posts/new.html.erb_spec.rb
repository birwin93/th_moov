require 'spec_helper'

describe "posts/new" do
  before(:each) do
    assign(:post, stub_model(Post,
      :author_id => 1,
      :content => "MyString"
    ).as_new_record)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path, :method => "post" do
      assert_select "input#post_author_id", :name => "post[author_id]"
      assert_select "input#post_content", :name => "post[content]"
    end
  end
end
