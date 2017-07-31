require 'spec_helper'
require 'rails_helper'

# feature "the signup process" do
#
#   scenario "has a new user page" do
#     visit new_user_url
#     expect(page).to have_content "New User"
#   end
#   feature "signing up a user" do
#     before(:each) do
#        visit new_user_url
#        fill_in 'Username', :with => "whatever"
#        fill_in 'Password', :with => "biscuits"
#        click_on "Create User"
#    end
#
#     scenario "shows username on the homepage after signup" do
#       expect(page).to have_content "whatever"
#     end
#
#   end
#
# end

feature "creating a new goal" do
  before(:each) do
    user = User.create(username: "Dora", password: "theexplorer")
    visit new_session_url
    fill_in 'Username', with: "Dora"
    fill_in 'Password', with: "theexplorer"
    click_on "Log In"
  end

  scenario "redirects to created goal page" do
    visit new_goal_url
    fill_in 'Title', with: 'Get more sleep'
    fill_in 'Details', with: 'Get at least eight hours of sleep'
    check('Private?')
    click_on 'New Goal'

    expect(page).to have_content("Get more sleep")
    expect(page).to have_content("Get at least eight hours of sleep")
    expect(page).to have_content("Private")
    expect(page).to have_content("Ongoing")

  end
end

feature "Accessing other users goals" do
  before(:each) do
    sign_up("Dora")
  end

  scenario "redirects to accessed users show page if goal is PRIVATE" do
    make_goal({title: "Dora needs more adventure!", details: "Make more friends", private: true})
    goal_id = Goal.last.id

    click_on 'Log Out'
    sign_up("bob")
    visit("/goals/#{goal_id}")

    expect(page).not_to have_content("Dora needs more adventure!")
    expect(page).not_to have_content("Make more friends")

  end

  scenario "shows goal page if PUBLIC" do
    make_goal({title: "Dora needs Less adventure!", details: "Make less friends"})
    goal_id = Goal.last.id

    click_on 'Log Out'
    sign_up("bob")
    visit("/goals/#{goal_id}")

    expect(page).to have_content("Dora needs Less adventure!")
    expect(page).to have_content("Make less friends")

  end
end
