FactoryBot.define do
  factory :sell do
    good_name {Faker::Name.name}
    text {Faker::Lorem.sentence}
    price {Faker::Number.between(from: 300, to: 9999999)} 

    category_id {Faker::Number.between(from: 2, to: 11)} 
    condition_id {Faker::Number.between(from: 2, to: 7)}
    postage_id {Faker::Number.between(from: 2, to: 3)}
    delivery_id {Faker::Number.between(from: 2, to:4)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}

    association :user

    after(:build) do |sell|
      sell.image.attach(io: File.open('public/images/5mvvi83j09h.jpeg'), filename: '5mvvi83j09h.jpeg')
    end

  end
end
