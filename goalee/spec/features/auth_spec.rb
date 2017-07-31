require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end
  feature "signing up a user" do
    before(:each) do
       visit new_user_url
       fill_in 'Username', :with => "whatever"
       fill_in 'Password', :with => "biscuits"
       click_on "Create User"
   end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content "whatever"
    end

  end

end

feature "logging in" do
  before(:each) do
    user = User.create(username: "Dora", password: "theexplorer")
    visit new_session_url
    fill_in 'Username', with: "Dora"
    fill_in 'Password', with: "theexplorer"
    click_on "Log In"
  end


  scenario "shows username on the homepage after login" do
    expect(page).to have_content "Dora"
  end
end

feature "logging out" do

  scenario "begins with a logged out state" do
    user = User.create(username: "Dora", password: "theexplorer")
    visit user_url(user.id)
    expect(page).to have_content "Log In"

  end

  scenario "doesn't show username on the homepage after logout" do
    user = User.create(username: "Dora", password: "theexplorer")
    visit new_session_url
    fill_in 'Username', with: "Dora"
    fill_in 'Password', with: "theexplorer"
    click_on "Log In"
    click_on 'Log Out'

    expect(page).not_to have_content "Dora"
  end

end
