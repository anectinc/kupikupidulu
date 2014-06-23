require 'rails_helper'

RSpec.describe "articles/new", :type => :view do
  before(:each) do
    assign(:article, Article.new(
      :category => nil,
      :title => "MyString",
      :description => "MyText",
      :source_name => "MyString",
      :source_url => "MyString",
      :poster_name => "MyString",
      :twitter_shared_count => 1,
      :facebook_shared_count => 1,
      :shared_count => 1
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input#article_category_id[name=?]", "article[category_id]"

      assert_select "input#article_title[name=?]", "article[title]"

      assert_select "textarea#article_description[name=?]", "article[description]"

      assert_select "input#article_source_name[name=?]", "article[source_name]"

      assert_select "input#article_source_url[name=?]", "article[source_url]"

      assert_select "input#article_poster_name[name=?]", "article[poster_name]"

      assert_select "input#article_twitter_shared_count[name=?]", "article[twitter_shared_count]"

      assert_select "input#article_facebook_shared_count[name=?]", "article[facebook_shared_count]"

      assert_select "input#article_shared_count[name=?]", "article[shared_count]"
    end
  end
end
