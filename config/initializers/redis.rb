unless Rails.env == "test"
  uri = URI.parse(ENV["REDISTOGO_URL"])
  REDIS = Redis.new(:url => ENV["REDISTOGO_URL"])
end
