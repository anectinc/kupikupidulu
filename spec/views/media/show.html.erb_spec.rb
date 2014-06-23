require 'rails_helper'

RSpec.describe "media/show", :type => :view do
  before(:each) do
    @medium = assign(:medium, Medium.create!(
      :article => nil,
      :file => "File",
      :file_tmp => "File Tmp",
      :url => "Url",
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/File/)
    expect(rendered).to match(/File Tmp/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Type/)
  end
end
