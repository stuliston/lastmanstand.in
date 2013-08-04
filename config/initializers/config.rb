YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env].each do |key, value|
  LastManStanding.config.send "#{key}=", Hashie::Mash.new(value)
end