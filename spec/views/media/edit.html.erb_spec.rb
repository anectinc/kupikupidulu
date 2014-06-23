require 'rails_helper'

RSpec.describe "media/edit", :type => :view do
  before(:each) do
    @medium = assign(:medium, Medium.create!(
      :article => nil,
      :file => "MyString",
      :file_tmp => "MyString",
      :url => "MyString",
      :type => ""
    ))
  end

  it "renders the edit medium form" do
    render

    assert_select "form[action=?][method=?]", medium_path(@medium), "post" do

      assert_select "input#medium_article_id[name=?]", "medium[article_id]"

      assert_select "input#medium_file[name=?]", "medium[file]"

      assert_select "input#medium_file_tmp[name=?]", "medium[file_tmp]"

      assert_select "input#medium_url[name=?]", "medium[url]"

      assert_select "input#medium_type[name=?]", "medium[type]"
    end
  end
end
