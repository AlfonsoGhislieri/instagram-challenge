module Helpers
  def sign_up(email:,password:,password_confirmation:)
    visit "/users/sign_up"
    find(:xpath, '//*[@id="user_email"]').set(email)
    find(:xpath, '//*[@id="user_password"]').set(password)
    find(:xpath, '//*[@id="user_password_confirmation"]').set(password_confirmation)
    find(:xpath, '//*[@id="new_user"]/div[5]/input').click
  end
end