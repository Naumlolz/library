HasuraHandler.setup do |config|
  config.auth_key = ENV['HASURA_SERVICE_KEY'] || Rails.application.credentials.hasura_service_key
end