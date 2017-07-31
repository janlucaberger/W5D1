require 'spec_helper'
require 'rails_helper'

feature "creating a comment" do
  before(:each) do
    sign_up("Dora")
    make_goal()
  end

  scenario "render errors if body is blank" do
    click_on 'Log Out'
    sign_up("Bob")
    visit("/goals/#{Goal.last.id}")
    make_goal_comment({body: ""})

    expect(page).to have_content("Body can't be blank")
  end

end
