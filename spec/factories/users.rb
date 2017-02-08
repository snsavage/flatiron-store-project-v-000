FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "example#{n}@example.com"
    end

    password "password"
    password_confirmation "password"
  end
end
