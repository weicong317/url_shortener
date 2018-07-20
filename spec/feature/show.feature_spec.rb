require 'rails_helper'

describe "showing feature", type: :feature do
  let(:proper_long_url)		{ 'http://www.google.com' }
	let(:proper_short_url)	{ SecureRandom.base64[0..8] }

  before :each do
    Url.create(long_url: proper_long_url, short_url: proper_short_url)
  end

  it "user want view specific long url with short url together" do
    visit root_path
    click_link proper_long_url
    expect(page).to have_content("Long url: #{proper_long_url}")
    expect(page).to have_content("Short url: #{proper_short_url}")
  end
end