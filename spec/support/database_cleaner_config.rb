RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)

    load "#{Rails.root}/db/seeds.rb"
  end

  config.around(:each) do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.cleaning do
      example.run
    end

    load "#{Rails.root}/db/seeds.rb" if example.metadata[:js]
    Capybara.reset_sessions!
  end
end