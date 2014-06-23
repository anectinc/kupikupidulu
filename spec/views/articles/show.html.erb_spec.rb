require 'rails_helper'

RSpec.describe "articles/show", :type => :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :category => nil,
      :title => "Title",
      :description => "MyText",
      :source_name => "Source Name",
      :source_url => "Source Url",
      :poster_name => "Poster Name",
      :twitter_shared_count => 1,
      :facebook_shared_count => 2,
      :shared_count => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Source Name/)
    expect(rendered).to match(/Source Url/)
    expect(rendered).to match(/Poster Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
