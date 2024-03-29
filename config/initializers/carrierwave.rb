CarrierWave.configure do |config|
  require 'carrierwave/orm/activerecord'

  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     "ENV.fetch('AWS_ACCES_KEY_ID')",  # required
    aws_secret_access_key: "ENV.fetch('AWS_SECRET_AC_KEY')", # required
    region:                'eu-central-1',               # optional
  }
  config.fog_directory = 'el-monax-todo-api'               # required
end
