FactoryBot.define do

  factory :user do
    nickname              {Faker::Name.first_name}
    first_name            {"田中"}
    last_name             {"宏和"}
    first_name_kana       {"タナカ"}
    last_name_kana        {"ヒロカズ"}
    birthday              {Faker::Date.birthday}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
  end

end