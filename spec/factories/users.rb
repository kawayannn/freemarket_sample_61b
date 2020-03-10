FactoryBot.define do

  factory :user do
    nickname              {"yyysss"}
    first_name            {"田中"}
    last_name             {"太郎"}
    first_name_kana       {"タナカ"}
    last_name_kana        {"タロウ"}
    year                  {"10"}
    month                 {"5"}
    day                   {"1"}
    email                 {Faker::Internet.free_email}
    password              {"00000000"}
  end

end