FactoryGirl.define do
  factory :exchange_rate do
    currency "MyString"
    conversion_currency "MyString"
    rate 1.5
  end
end
