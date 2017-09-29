class ServiceProvider < ApplicationRecord
  before_save :set_flat_rate_usd

  monetize :flat_rate_cents
  monetize :flat_rate_usd_cents

  validates_presence_of :name, :flat_rate

  private

  def set_flat_rate_usd
    self.flat_rate_usd = flat_rate.as_us_dollar
  end
end
