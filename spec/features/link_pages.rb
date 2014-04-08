require 'spec_helper'

feature 'user creates a link' do
  scenario 'successfully create a link' do
    visit root_path
    click_link "Add a new link"
    fill_in "Title", with: "reddit"
    fill_in "Url", with: "www.reddit.com"
    click_button "Create Link"
    page.should have_content "reddit has been added"
  end
  scenario 'successfully upvotes the link' do
    visit root_path
    click_link "Add a new link"
    fill_in "Title", with: "reddit"
    fill_in "Url", with: "www.reddit.com"
    click_button "Create Link"
    click_link "↑"
    click_link "↑"
    page.should have_content "2"
  end
  scenario 'successfully deletes a link' do
    visit root_path
    click_link "Add a new link"
    fill_in "Title", with: "reddit"
    fill_in "Url", with: "www.reddit.com"
    click_button "Create Link"
    click_link "delete"
    page.should_not have_content 'reddit'
  end
end
