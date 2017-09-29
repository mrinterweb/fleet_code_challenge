require 'csv'

class ImportCSV
  def initialize(file_name)
    if File.exists?(file_name)
      @file_name = file_name
    else
      raise "file not found"
    end
  end

  def import(&block)
    successful_row = 0
    failed_rows = []
    CSV.foreach(@file_name, { headers: { first_row: true } }) do |row|
      record = yield row
      if record.save
        successful_row += 1
      else
        failed_rows << { errors: record.errors.messages, input: row.fields }
      end
    end
    { successful_rows: successful_row, failed_rows: failed_rows }
  end
end
