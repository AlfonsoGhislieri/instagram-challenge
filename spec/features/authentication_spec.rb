require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  before do
    sign_up(email:"test@test.com",password:"123456",password_confirmation:"123456")
  end

  context "logged in" do
    scenario "success message when logged in" do
      find(:xpath, '/html/body/nav/ul/li/form/input[2]').click
      find(:xpath, '//*[@id="user_email"]').set("test@test.com")
      find(:xpath, '//*[@id="user_password"]').set('123456')
      find(:xpath, '//*[@id="new_user"]/div[4]/input').click

      expect(page).to have_content('Signed in successfully.')
    end

    scenario "can go to posts page when logged in" do
      visit("/posts")
      expect(page).to have_content('Create Post')
      find(:xpath, '/html/body/nav/ul/li[1]/a').click
      expect(page).to have_current_path("/posts/new")
    end
  end

  context "logged out" do
    before do
      click_button "Log Out"
    end

    scenario "cannot go to posts page" do
      visit("/posts")
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end

    scenario "cannot go to edit user page" do
      visit("/users/edit")
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end

    scenario "cannot go to edit a post" do
      visit("/posts/1/edit")
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end