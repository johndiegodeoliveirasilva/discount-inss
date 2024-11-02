FactoryBot.define do
  factory :proposer do
    full_name { Faker::Name.name }
    document { Faker::IDNumber.brazilian_citizen_number }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
    income { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
    user
  end
end
