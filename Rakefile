require 'authifer/tasks'
require './initializers/dotenv'

desc "includes the full application environment"
task :environment do
  require './auth_makeheadspace_app'
end

Rake::Task['authifer:db:migrate'].enhance [:environment]

