
FactoryBot.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :like do
    association :user
    likeable { build(:post, user: build(:user, email: "test2@gmail.com")) }
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

    after(:build) do |user|
      user.avatar.attach(
        io: File.open('spec/images/default_avatar.png'),
        filename: 'default_avatar.png',
        content_type: 'image/png')
    end
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
