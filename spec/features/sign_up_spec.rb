require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  sign_up_email = '//*[@id="user_email"]'
  sign_up_password = '//*[@id="user_password"]'
  sign_up_password_confirmation = '//*[@id="user_password_confirmation"]'
  sign_up_button_confirmation = '//*[@id="new_user"]/div[4]/input'
  sign_up_button = '/html/body/a[1]'
  log_out_button = '/html/body/nav/ul/li/form/input[2]'

  before :each do
    visit '/'
  end

  scenario 'Can sign up' do
    find(:xpath, sign_up_button).click
    find(:xpath, sign_up_email).set('test@test.com')
    find(:xpath, sign_up_password).set('123456')
    find(:xpath, sign_up_password_confirmation).set('123456')
    find(:xpath, sign_up_button_confirmation).click
    
    expect(page).to have_content('You are signed in as test@test.com')
    expect(page).not_to have_content 'Sign up'
  end

  scenario 'Cannot sign up if password is too short' do
    find(:xpath, sign_up_button).click
    find(:xpath, sign_up_email).set('test@test.com')
    find(:xpath, sign_up_password).set('12345')
    find(:xpath, sign_up_password_confirmation).set('12345')
    find(:xpath, sign_up_button_confirmation).click
    
    expect(page).not_to have_content('You are signed in as test@test.com')
    expect(page).to have_content( 'Password is too short (minimum is 6 characters)')
    expect(page).to have_content 'Sign up'
  end

  scenario 'Cannot sign up if email is invalid' do
    find(:xpath, sign_up_button).click
    find(:xpath, sign_up_email).set('test')
    find(:xpath, sign_up_password).set('123456')
    find(:xpath, sign_up_password_confirmation).set('123456')
    find(:xpath, sign_up_button_confirmation).click
    
    expect(page).not_to have_content('You are signed in as test@test.com')
    expect(page).to have_content('Email is invalid')
  end

  scenario 'Cannot sign up if email is taken' do
    find(:xpath, sign_up_button).click
    find(:xpath, sign_up_email).set('test@test.com')
    find(:xpath, sign_up_password).set('123456')
    find(:xpath, sign_up_password_confirmation).set('123456')
    find(:xpath, sign_up_button_confirmation).click

    find(:xpath, log_out_button).click

    find(:xpath, sign_up_button).click
    find(:xpath, sign_up_email).set('test@test.com')
    find(:xpath, sign_up_password).set('123456')
    find(:xpath, sign_up_password_confirmation).set('123456')
    find(:xpath, sign_up_button_confirmation).click
    
    expect(page).to have_content('Email has already been taken')
  end

  scenario "Cannot sign up if passwords don't match" do
    find(:xpath, sign_up_button).click
    find(:xpath, sign_up_email).set('test@test.com')
    find(:xpath, sign_up_password).set('123456')
    find(:xpath, sign_up_password_confirmation).set('123457')
    find(:xpath, sign_up_button_confirmation).click
    
    expect(page).not_to have_content('You are signed in as test@test.com')
    expect(page).to have_content("Password confirmation doesn't match")
  end

  scenario "Cannot sign up if email is invalid and passwords don't match" do
    find(:xpath, sign_up_button).click
    find(:xpath, sign_up_email).set('test')
    find(:xpath, sign_up_password).set('123456')
    find(:xpath, sign_up_password_confirmation).set('123457')
    find(:xpath, sign_up_button_confirmation).click
    
    expect(page).not_to have_content('You are signed in as test@test.com')
    expect(page).to have_content("Email is invalid Password confirmation doesn't match Password")
  end

  scenario 'Cannot sign up if email is invalid and passwords is too short' do
    find(:xpath, sign_up_button).click
    find(:xpath, sign_up_email).set('test')
    find(:xpath, sign_up_password).set('123456')
    find(:xpath, sign_up_password_confirmation).set('123457')
    find(:xpath, sign_up_button_confirmation).click
    
    expect(page).not_to have_content('You are signed in as test@test.com')
    expect(page).to have_content("Email is invalid Password confirmation doesn't match Password")
  end
end
