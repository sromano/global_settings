require 'test_helper'

class GlobalSettingsTest < ActiveSupport::TestCase

  test "stores string values" do
    GlobalSettings::Settings["abc"] = "my string"
    assert_equal "my string", GlobalSettings::Settings["abc"]
  end

  test "stores boolean values" do
    GlobalSettings::Settings["abc"] = true
    assert GlobalSettings::Settings["abc"]

    GlobalSettings::Settings["abc"] = false
    assert_not GlobalSettings::Settings["abc"]
  end

  test "stores integer values" do
    GlobalSettings::Settings["abcd"] = 1
    assert_equal 1, GlobalSettings::Settings["abcd"]
  end

  test "stores float values" do
    GlobalSettings::Settings["dd"] = 1.5
    assert_equal 1.5, GlobalSettings::Settings["dd"]
  end

  test "value is saved in ActiveRecord" do
    key = "123"
    assert_not GlobalSettings::Settings.where(key: key).any?
    GlobalSettings::Settings[key] = 1.5
    assert GlobalSettings::Settings.where(key: key).any?
  end

  test "value is saved in cache" do
    Rails.cache.delete("global-settings:dd")
    GlobalSettings::Settings["dd"] = 1.5
    assert_equal 1.5, Rails.cache.read("global-settings:dd")
  end

end
