FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    password_confirmation { password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address_one '123 Any St.'
    city { Faker::Address.city }
    state { Faker::Address.state }
    country { Faker::Address.country }
    postal_code { Faker::Address.postcode }
    mobile { Faker::PhoneNumber.cell_phone }
    preferred_location 'Lubbock'
    source 'Google'
    time_zone "(GMT-03:00) Greenland"
    agree_to_terms true

    factory :paid_user do
      paid true
    end

    factory :with_not_accepted_terms do
      agree_to_terms false
    end
  end
end