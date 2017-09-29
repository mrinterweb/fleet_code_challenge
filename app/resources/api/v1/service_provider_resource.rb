class Api::V1::ServiceProviderResource < JSONAPI::Resource
  attributes :name, :flat_rate, :flat_rate_currency, :updated_at
  has_many :rates

  def flat_rate
    @model.flat_rate
  end
end
