require 'rails_helper'

FactoryBot.define do
  
  factory :user do
    id {1}
    email {"test@gmail.com"}
    password {"test123"}
  end
end