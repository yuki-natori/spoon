FactoryBot.define do

  factory :item do
    name                 {"スプーン"}
    price                {"500"}
    description          {"オススメです"}
    condition            {"新品"}
    shipping_from        {"北海道"}
    days_before_shipping {"2~3日"}
    shipping_method      {"日本郵便：スマートレター"}
    brand                {"ダイワ"}
    category             {"川"}
  end
end