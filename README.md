GlobalSettings
=========
by Sergio Romano

This is a simple gem to solve S&D exercise and uses MIT-LICENSE.


####To install
Add in your Gemfile the following line and run *bundle install*
```
gem 'global_settings', :git => 'git://github.com/sromano/global_setings.git'
```

Then generate and run the necessary migrations to store global settings in your database
```
rails g global_settings
rake db:migrate
```

####To use

GlobalSettings can be used to store global settings of any YAML encodable type (although it is mainly design for string, boolean, float and integers according to the exercise description.

```
#To fetch the global setting value for "a key" setting, simple use
GlobalSettings::Settings["a key"]

#To store a new global setting value for "a key" setting, simple use
GlobalSettings::Settings["a key"] = new_value
```
