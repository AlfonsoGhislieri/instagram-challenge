require 'rails_helper'

RSpec.feature "Navbar", type: :feature do

  context "logged in" do
    scenario "Can see log out button" do
      sign_up
      expect(page).to have_button("Log Out")
    end

    scenario "Instagram home button takes you to posts" do
      sign_up
      click_link "Instagram"
      expect(page).to have_current_path("/posts")
    end
  end

  context "logged out" do
    scenario "log out button not visible if not signed in" do
      expect(page).to_not have_button("Log Out")
    end

    scenario "Instagram home button makes you login or sign up" do
      visit("/")
      click_link "Instagram"
      expect(page).to have_content("You need to sign in or sign up before continuing.")
    end
  end
end