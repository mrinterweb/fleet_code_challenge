namespace :import do
  require 'import_csv'
  require 'pp'

  desc 'Import service providers'
  task :service_providers, [:file_name] => :environment do |task, args|
    results = ImportCSV.new(args.file_name).import do |row|
      remote_id, name, rate, currency = *row.fields
      attributes = {
        remote_id: remote_id.to_i,
        name: name,
        flat_rate: Money.new(rate.to_f * 100, currency)
      }

      # check for existing
      existing = ServiceProvider.find_by(remote_id: remote_id)
      if existing
        existing.attributes = attributes
        existing
      else
        ServiceProvider.new(attributes)
      end
    end
    puts results
  end

  desc 'Import rates'
  task :rates, [:file_name] => :environment do |task, args|
    Rate.destroy_all

    results = ImportCSV.new(args.file_name).import do |row|
      rate, currency, origin, destination, remote_service_provider_id = *row.fields

      service_provider = ServiceProvider.find_by(remote_id: remote_service_provider_id.to_i)
      Rate.new(
        rate: Money.new(rate.to_f * 100, currency),
        origin: origin,
        destination: destination,
        service_provider: service_provider
      )
    end

    pp results
  end
end
