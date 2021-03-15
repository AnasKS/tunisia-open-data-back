# frozen_string_literal: true

RSpec.configure do |config|
  DatabaseCleaner[:active_record].strategy = :transaction
  DatabaseCleaner[:active_record].clean_with(:transaction)

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
