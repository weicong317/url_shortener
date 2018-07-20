require 'rails_helper'

describe "urls/index.html.erb", type: :view do
  let(:proper_long_url)		{ 'http://www.google.com' }
  let(:proper_short_url)	{ SecureRandom.base64[0..8] }

  it "displays the index" do
    assign :url, [Url.create(long_url: proper_long_url, short_url: proper_short_url)]

    render
    
    expect(rendered).to have_table
    expect(rendered).to have_content("Long")
    expect(rendered).to have_content("Short")
    expect(rendered).to have_content(proper_long_url)
    expect(rendered).to have_content(proper_short_url)
    expect(rendered).to have_button("Post")
  end
end