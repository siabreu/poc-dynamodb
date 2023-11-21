require "dynamoid"

Dynamoid.configure do |config|
  # Local DDB endpoint:
  config.endpoint = "http://localhost:4566"

  # Fake AWS credentials for local development purposes:
  config.access_key = "localstack"
  config.secret_key = "localstack"
  config.region = "us-east-1"

  # Do not add prefixes to table names. By default dynamoid uses `dynamoid_#{application_name}_#{environment}` prefix:
  config.namespace = nil

  # Tells Dynamoid to use exponential backoff for batch operations (BatchGetItem, BatchPutItem)
  config.backoff = { exponential: { base_backoff: 0.2.seconds, ceiling: 10 } }

  # Do not add timestamps (created_at, updated_at) fields by default
  config.timestamps = false

  # Store datetimes as ISO-8601 strings by default. Otherwise UNIX timestamps will be used.
  config.store_datetime_as_string = true
end
