module GlobalSettings
  class Settings < ActiveRecord::Base

    after_create :write_cache
    after_update :write_cache
    after_destroy :destroy_cache

    #Get a setting value from *key*
    def self.[](key)
      Rails.cache.fetch(cache_key(key)) do
        obj = where(:key => key).first
        obj.value if obj
      end
    end

    #Set a setting *value* for the provided *key*
    def self.[]=(key, value)
      var_name = var_name.to_s

      new_record = find_or_initialize_by(key: key)
      new_record.value = value
      new_record.save!

      value
    end

    #Enconde value in YAML
    def value=(new_value)
      self[:value] = new_value.to_yaml
    end

    #Decode value from YAML
    def value
      YAML::load(self[:value])
    end

private

    #Store raw YAML string
    def write_cache
      Rails.cache.write(Settings.cache_key(self.key), self.value)
    end

    def destroy_cache
      Rails.cache.delete(Settings.cache_key(self.key))
    end

    def self.cache_key(setting_key)
      "global-settings:#{setting_key}"
    end

  end
end
