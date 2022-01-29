
FactoryBot.define do
  factory :like do
    association :user

    likeable_type { "Post" }
    likeable_id { 2 }
  end

  factory :comment do
    body { "MyText" }
    association :user
    post { build(:post, user: build(:user, email: "test2@gmail.com"))}
  end

  factory :user do
    username {'test'}
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
