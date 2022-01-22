require 'rails_helper'

FactoryBot.define do
  
  factory :user do
    email {'test@gmail.com'}
    password {'test123'}
  end

  factory :post do
    message {"Test post"}
    association :user
  end
end