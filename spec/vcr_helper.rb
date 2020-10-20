VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.allow_http_connections_when_no_cassette = true
  config.hook_into :webmock
  config.ignore_localhost = true
  config.configure_rspec_metadata!
  config.filter_sensitive_data('<CONTENTFUL_ACCESS_TOKEN>') { ENV.fetch('CONTENTFUL_ACCESS_TOKEN') }
  config.filter_sensitive_data('<CONTENTFUL_SPACE_ID') { ENV.fetch('CONTENTFUL_SPACE_ID') }
  config.filter_sensitive_data('<CONTENTFUL_ENVIRONMENT') { ENV.fetch('CONTENTFUL_ENVIRONMENT') }
end
