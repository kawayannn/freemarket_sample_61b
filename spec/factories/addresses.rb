FactoryBot.define do
  factory :addresse do
    phonenumber {Faker::PhoneNumber.cell_phone}
  end
end