require './config/environment'

# v2.6.1
# if ActiveRecord::Base.connection.migration_context.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

#
if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

run ApplicationController
