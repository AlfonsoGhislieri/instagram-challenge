module Helpers
  def sign_up
    visit "/"
    find(:xpath, '/html/body/a[1]').click
    find(:xpath, '//*[@id="user_email"]').set("test@test.com")
    find(:xpath, '//*[@id="user_password"]').set("test123")
    find(:xpath, '//*[@id="user_password_confirmation"]').set("test123")
    find(:xpath, '//*[@id="new_user"]/div[4]/input').click
  end
end