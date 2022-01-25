require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do

  before :each do
    visit '/users/sign_up'
  end

  scenario 'Can sign up' do
    sign_up(email:'test@test.com',password:'123456',password_confirmation:'123456')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'Cannot sign up if password is too short' do
    sign_up(email:'test@test.com',password:'12345',password_confirmation:'12345')
    expect(page).to have_content( 'Password is too short (minimum is 6 characters)')
  end

  scenario 'Cannot sign up if email is invalid' do
    sign_up(email:'testtest.com',password:'123456',password_confirmation:'123456')
    expect(page).to have_content('Email is invalid')
  end

  scenario 'Cannot sign up if email is taken' do
    sign_up(email:'test@test.com',password:'123456',password_confirmation:'123456')
    find(:xpath, '/html/body/nav/ul/li/form/input[2]').click

    sign_up(email:'test@test.com',password:'123456',password_confirmation:'123456')
    expect(page).to have_content('Email has already been taken')
  end

  scenario "Cannot sign up if passwords don't match" do
    sign_up(email:'test@test.com',password:'123456',password_confirmation:'123457')
    expect(page).to have_content("Password confirmation doesn't match")
  end

  scenario "Cannot sign up if email is invalid and passwords don't match" do
    sign_up(email:'test',password:'123459',password_confirmation:'123457')
    expect(page).to have_content("Email is invalid Password confirmation doesn't match Password")
  end
end
