require_relative '../../test_helper'

class UserCanViewAllSkills < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def create_skill(id, name, status)
    data = {id: id, name: name, status: status}

    Skill.new(data)
  end

  def test_user_can_view_all_skills
    golf = create_skill(1, "golf", "good")
    tennis = create_skill(2, "tennis", "bad")

    #as a user
    #when I am at the root
    visit '/'
    # and i click on skill index
    click_link("Skill Index")
    # then I view all skills
    assert_equal '/skills', current_path

    within(".skill-list") do
        assert page.has_content?(golf.id)
        assert page.has_content?(golf.name)
        assert page.has_link?(golf.name)

        assert page.has_content?(tennis.id)
        assert page.has_content?(tennis.name)
        assert page.has_link?(tennis.name)
    
    end
  end


end
