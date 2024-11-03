# frozen_string_literal: true

RSpec.configure do |config|
  tables_to_truncate = %w[users proposers addresses phones]
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation, only: tables_to_truncate)
  end
  config.before(:each) do
    DatabaseCleaner.strategy = DatabaseCleaner::ActiveRecord::Truncation.new(only: tables_to_keep)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
