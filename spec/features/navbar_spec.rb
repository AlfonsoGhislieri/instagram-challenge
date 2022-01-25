require 'rails_helper'

RSpec.feature "Navbar", type: :feature do

  context "logged in" do
    before do
      sign_up(email:"test@test.com",password:"123456",password_confirmation:"123456")
    end
    scenario "Can see log out button and create post" do
      expect(page).to have_button("Log Out")
      expect(page).to have_content("Create Post")
    end

    scenario "Instagram icon button takes you to posts" do
      find(:xpath, '//*[@id="navbar-icon"]').click
      expect(page).to have_current_path("/posts")
    end

    scenario "clicking Instagram title takes you to posts" do
      find(:xpath, '/html/body/nav/a[2]').click
      expect(page).to have_current_path("/posts")
    end
  end

  context "logged out" do
    scenario "log out button not visible if not signed in" do
      expect(page).to_not have_button("Log Out")
    end

    scenario "Instagram home button makes you login or sign up" do
      visit("/")
      find(:xpath, '/html/body/nav/a[1]/img').click
      expect(page).to have_content("You need to sign in or sign up before continuing.")
    end
  end
end