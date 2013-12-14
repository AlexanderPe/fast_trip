FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :trip do
  	title "avg" 
    content "Lorem ipsum"
    image "image.png"
    user
  end
end