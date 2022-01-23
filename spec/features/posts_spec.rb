require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  message_field = '//*[@id="post_message"]'
  image_field = '//*[@id="post_image"]'
  create_button = '/html/body/form/div[3]/input'

  before do
    sign_up
    visit "/posts/new"
  end

  scenario "Submitting just message returns error" do
    find(:xpath, message_field).set("Test")
    find(:xpath, create_button).click
    
    expect(page).to have_content("Image can't be blank")
  end

  scenario "Submitting message and image displays post" do
    find(:xpath, message_field).set("Test message")
    find(:xpath, image_field).set("spec/images/Scooby-Doo.png")
    find(:xpath, create_button).click

    expect(page).to have_content("Test message")
    expect(page).to have_css("img[src*='Scooby-Doo.png']")    
  end

  scenario "Submitting just image displays post" do
    find(:xpath, image_field).set("spec/images/ShaggyRogers.png")
    find(:xpath, create_button).click

    expect(page).to have_css("img[src*='ShaggyRogers.png']")     
  end

  scenario "/posts displays all posts" do
    find(:xpath, message_field).set("Test message")
    find(:xpath, image_field).set("spec/images/Scooby-Doo.png")
    find(:xpath, create_button).click

    visit "/posts/new"
    find(:xpath, image_field).set("spec/images/ShaggyRogers.png")
    find(:xpath, create_button).click

    visit("/posts")
    expect(page).to have_content("Test message")
    expect(page).to have_css("img[src*='Scooby-Doo.png']")  
    expect(page).to have_css("img[src*='ShaggyRogers.png']")   
  end

end