FactoryGirl.define do
  factory :service_provider do
    name "ACME Shipping"
    flat_rate { Money.new(1500, 'EUR') }
  end
end
