source "https://rubygems.org"
ruby "2.1.5"

gem "rails", "4.1"

gem "bootstrap-sass", "~> 3.2.0"
gem "autoprefixer-rails"
gem "best_in_place", :git => 'https://github.com/bernat/best_in_place'

gem "awesome_print"
gem "jquery-rails"
gem "pg"
gem "bcrypt"
gem "pry-rails"
gem "delayed_job_active_record"
gem "rails-html-sanitizer"
gem "slim"
gem "rest_client"
gem "turbolinks"
gem "uglifier"

group :production do
  gem "rails_12factor"
end

group :development do
  gem "annotate"
  gem "capistrano-rails"
end
group :development, :test do
  gem "rspec-rails"
  gem "pry-byebug"
  gem "spring"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "database_cleaner"
  gem "factory_girl_rails"
  gem "spring-commands-rspec"
end
