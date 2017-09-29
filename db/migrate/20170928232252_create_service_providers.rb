class CreateServiceProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :service_providers do |t|
      t.string :name
      t.monetize :flat_rate
      t.monetize :flat_rate_usd, currency: { present: false }

      t.timestamps
    end
  end
end
