require 'rails_helper'

describe "posting feature", type: :feature do
  let(:proper_long_url)		{ 'http://www.google.com' }

  it "user want to post long url" do
    visit root_path
    click_button "Post"
    fill_in("url[long_url]", with: proper_long_url)
    click_button "Submit"
    expect(page).to have_content(proper_long_url)
  end

  it "user puts invalid long url" do
    visit root_path
    click_button "Post"
    fill_in("url[long_url]", with: "abc")
    click_button "Submit"
    expect(page).to have_content("Invalid url")
  end
end