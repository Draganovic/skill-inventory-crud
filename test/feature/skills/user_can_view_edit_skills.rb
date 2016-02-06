require_relative '../../test_helper'

class UserCanViewEditSkills < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def create_skill(id, name, status)
    data = {id: id, name: name, status: status}

    Skill.new(data)
  end

  def test_user_can_edit_skills
    

  end
