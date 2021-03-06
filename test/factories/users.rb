FactoryGirl.define do
  factory :user do
    display_name    { Faker::Name.name }
    password_confirmation { |u| u.password }
    admin false
    password 'password'
    is_private false
    confirmed_at { Faker::Date.between(2.days.ago, Date.today) }
    email           { Faker::Internet.email }
    trait :user_setting do
      location        { "#{Faker::Address.city_prefix}, #{Faker::Address.state}" }
      years_experience { (rand(9) + rand(9)) + 1}
    end
    trait :admin do
      admin :false
    end
    trait :is_private do
      is_private :true
    end
  end
end

FactoryGirl.define do
  #Other factory definitions

  factory :confirmed_user, :parent => :user do
    after(:create) { |user| user.confirm! }
  end
end
