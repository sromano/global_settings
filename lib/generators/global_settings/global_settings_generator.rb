require 'rails/generators'
require 'rails/generators/migration'

module GlobalSettings
  class GlobalSettingsGenerator < Rails::Generators::Base
    include Rails::Generators::Migration

    desc "Generates migration to persist GlobalSettings::Settings"
    source_root File.expand_path('../', __FILE__)

    def create_migration_file
      migration_template 'settings_migration.rb', 'db/migrate/settings_migration'
    end

    def self.next_migration_number(dirname)
      if ActiveRecord::Base.timestamped_migrations
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end
  end
end
