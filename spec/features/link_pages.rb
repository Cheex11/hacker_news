require 'spec_helper'

feature 'user creates a link' do
  scenario 'successfully create a link' do
    visit root_path
    click_link "Links"
    click_link "New Link"
    fill_in "Title", with: "reddit"
    fill_in "URL", with: "www.reddit.com"
    click_button "Create Link"
    page.should have_content "Link was successfully created."
  end
end
