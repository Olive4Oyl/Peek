require './config/environment'


if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use CommentController
use LocationController
use PostController
use UserController
run ApplicationController
