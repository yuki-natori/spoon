FactoryBot.define do

  factory :user do
    nickname              {"釣り太郎"}
    email                 {"kkk@gmail.com"}
    password              {"a00000"}
    password_confirmation {"a00000"}
    last_name             {"釣り"}
    first_name            {"太郎"}
    last_name_kana        {"ツリ"}
    first_name_kana       {"タロウ"}
    birthday              {"2020-06-25"}
  end
end