class CreateServiceProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :service_providers do |t|
      t.string :name
      t.float :flat_rate
      t.float :currency
      t.float :flat_rate_usd

      t.timestamps
    end
    add_index :service_providers, :flat_rate_usd
  end
end
