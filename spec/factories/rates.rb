FactoryGirl.define do
  factory :rate do
    rate { Money.new(100_00, 'EUR') }
    origin "US"
    destination "GB"
  end
end
