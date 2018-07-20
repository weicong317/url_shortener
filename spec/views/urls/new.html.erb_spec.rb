require 'rails_helper'

describe "urls/new.html.erb", type: :view do
  it "displays the long url form" do
    assign :url, Url.new
    render
    expect(rendered).to have_content("Long url")
    expect(rendered).to have_field("url[long_url]",type:'text')
    expect(rendered).to have_button("Submit")
  end
end