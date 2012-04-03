require 'cfruntime/properties'
 
# Run the equivalent of rake db:migrate on startup
if CFRuntime::CloudApp.running_in_cloud?
  migrations = Rails.root.join('db','migrate')
  if migrations.directory?
    ActiveRecord::Migrator.migrate(migrations)
  end
end