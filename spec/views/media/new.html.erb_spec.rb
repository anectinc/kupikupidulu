require 'rails_helper'

RSpec.describe "media/new", :type => :view do
  before(:each) do
    assign(:medium, Medium.new(
      :article => nil,
      :file => "MyString",
      :file_tmp => "MyString",
      :url => "MyString",
      :type => ""
    ))
  end

  it "renders new medium form" do
    render

    assert_select "form[action=?][method=?]", media_path, "post" do

      assert_select "input#medium_article_id[name=?]", "medium[article_id]"

      assert_select "input#medium_file[name=?]", "medium[file]"

      assert_select "input#medium_file_tmp[name=?]", "medium[file_tmp]"

      assert_select "input#medium_url[name=?]", "medium[url]"

      assert_select "input#medium_type[name=?]", "medium[type]"
    end
  end
end
