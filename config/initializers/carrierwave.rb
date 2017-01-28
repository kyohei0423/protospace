CarrierWave.configure do |config|

  case Rails.env
  when 'development'
    config.storage = :file
  when 'test'
    config.storage = :file
    config.enable_processing = false
  when 'production'
    config.storage = :fog
    config.fog_directory = 'production.example.com'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/example.com'
  end
end
