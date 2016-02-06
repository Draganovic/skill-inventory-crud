require_relative "../test_helper"

class SkillInventoryTest < Minitest::Test
  def create_skill
    data = {
      :name   => "a name",
      :status => "a status"
    }
    skill_inventory.create(data)
  end

  include TestHelpers
  def test_it_creates_a_skill
    data = {
      :name   => "a name",
      :status => "a status"
    }
    skill_inventory.create(data)

    skill = skill_inventory.all.last

    assert_equal "a name", skill.name
    assert_equal "a status", skill.status
    assert skill.id
  end

  def test_can_get_all_skills
    data1 = { name: "some skill1", status: "some status1" }
    data2 = { name: "some skill2", status: "some status2" }

    skill_inventory.create(data1)
    skill_inventory.create(data2)

    skills = skill_inventory.all

    assert_instance_of Skill, skills.last
    assert_equal 2, skills.length
  end

  def test_it_can_find_a_skill
    data = {
      :name   => "a name",
      :status => "a status"
    }
    skill_inventory.create(data)

    skill = skill_inventory.find(1)

    assert skill.id
    assert_equal "a name", skill.name
    assert_equal "a status", skill.status
  end

  def test_can_update_skill
    data = {
      :name   => "a name",
      :status => "a status"
    }
    skill_inventory.create(data)

    skill_inventory.update(1, { "name" => "new name" })
    skill = skill_inventory.find(1)

    assert skill.id
    assert_equal "new name", skill.name
    assert_equal "a status", skill.status
  end

  def test_it_can_delete
    data = {
      :name   => "a name",
      :status => "a status"
    }
    skill_inventory.create(data)

    skill_inventory.delete(1)

    skills = skill_inventory.all

    assert_equal 0, skills.length
  end

end
