CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: 'AKIAJ6RGLGWEXABBLEAQ',
    aws_secret_access_key: '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'
  }
  config.fog_directory = 'fast-trip'
end