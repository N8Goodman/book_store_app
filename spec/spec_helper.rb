require 'coveralls'
Coveralls.wear!('rails')
require 'factory_girl_rails'
require 'support/factory_girl'
require 'capybara/poltergeist'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

def expect_no_page_reload
  page.evaluate_script "$(document.body).addClass('not-reloaded')"
  yield
  expect(page).to have_selector("body.not-reloaded"),
    "Page should not be reloaded"
end
