require 'rails_helper'

RSpec.describe "media/index", :type => :view do
  before(:each) do
    assign(:media, [
      Medium.create!(
        :article => nil,
        :file => "File",
        :file_tmp => "File Tmp",
        :url => "Url",
        :type => "Type"
      ),
      Medium.create!(
        :article => nil,
        :file => "File",
        :file_tmp => "File Tmp",
        :url => "Url",
        :type => "Type"
      )
    ])
  end

  it "renders a list of media" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "File".to_s, :count => 2
    assert_select "tr>td", :text => "File Tmp".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
