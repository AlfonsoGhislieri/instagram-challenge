
FactoryBot.define do
  
  factory :user do
    email {'test@gmail.com'}
    password {'test123'}
  end

  factory :post do
    message {"Test post"}
    association :user
    
    after(:build) do |post|
      post.image.attach(
        io: File.open('spec/images/Scooby-Doo.png'),
        filename: 'Scooby-Doo.png',
        content_type: 'image/png')
    end
  end

end