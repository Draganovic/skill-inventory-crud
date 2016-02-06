ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'tilt/erb'
require 'capybara/dsl'

Capybara.app = SkillInventoryApp

module TestHelpers
  def teardown
    skill_inventory.delete_all
    super
  end

  def skill_inventory
    database = YAML::Store.new('db/skill_inventory_test')
    @skill_inventory_test ||= SkillInventory.new(database)
  end
end
