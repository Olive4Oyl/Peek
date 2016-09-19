require './config/environment'


if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending run `rake db:migrate` to resolve the issue.'
end

# Giphy::Configuration.configure do |config|
# config.version = "1.2.0"
# config.api_key = "dc6zaTOxFJmzC"
# end

Giphy::Configuration.configure do |config|
  # config.version = THE_API_VERSION
  config.api_key = "dc6zaTOxFJmzC"
end

use Rack::MethodOverride
use CommentController
use LocationController
use PostController
use UserController
run ApplicationController
