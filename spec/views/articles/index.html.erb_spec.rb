require 'rails_helper'

RSpec.describe "articles/index", :type => :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :category => nil,
        :title => "Title",
        :description => "MyText",
        :source_name => "Source Name",
        :source_url => "Source Url",
        :poster_name => "Poster Name",
        :twitter_shared_count => 1,
        :facebook_shared_count => 2,
        :shared_count => 3
      ),
      Article.create!(
        :category => nil,
        :title => "Title",
        :description => "MyText",
        :source_name => "Source Name",
        :source_url => "Source Url",
        :poster_name => "Poster Name",
        :twitter_shared_count => 1,
        :facebook_shared_count => 2,
        :shared_count => 3
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Source Name".to_s, :count => 2
    assert_select "tr>td", :text => "Source Url".to_s, :count => 2
    assert_select "tr>td", :text => "Poster Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
