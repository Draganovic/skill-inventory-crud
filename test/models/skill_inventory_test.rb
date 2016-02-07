require_relative "../test_helper"

class SkillInventoryTest < Minitest::Test
  include TestHelpers

  def create_skills(num)
    num.times do |i|
      skill_inventory.create(
        name:       "name#{i+1}",
        status: "status#{i+1}"
      )
    end
  end

  def test_can_create_a_skill
    skill_inventory.create(
      name: "name1",
      status: "status1"
    )

    skill = skill_inventory.all.last

    assert skill.id
    assert_equal "name1", skill.name
    assert_equal "status1", skill.status
  end

  def test_it_finds_all_skills
    create_skills(3)

    assert_equal 3, skill_inventory.all.count

    skill_inventory.all.each_with_index do |skill, index|
      assert_equal Skill, skill.class
      assert_equal "name#{index+1}", skill.name
      assert_equal "status#{index+1}", skill.status
    end
  end

  def test_it_finds_a_specific_skill
    create_skills(3)
    ids = skill_inventory.all.map { |skill| skill.id }

    ids.each_with_index do |id, index|
      skill = skill_inventory.find(id)
      assert_equal id, skill.id
      assert_equal "name#{index+1}", skill.name
      assert_equal "status#{index+1}", skill.status
    end
  end

  def test_it_updates_a_skill_record
    create_skills(2)

    new_data = {
      :name => "NEW name",
      :status => "NEW status"
    }

    id = skill_inventory.all.last.id


    skill_inventory.update(id, new_data)
    updated_skill = skill_inventory.find(id)

    assert_equal new_data[:name], updated_skill.name
    assert_equal new_data[:status], updated_skill.status
  end

  def test_it_deletes_a_skill_record
    create_skills(3)

    id = skill_inventory.all.last.id

    initial_count = skill_inventory.all.count
    skill_inventory.delete(id)

    final_count = skill_inventory.all.count

    assert_equal 1, (initial_count - final_count)
  end
end

# require_relative "../test_helper"
#
# class SkillInventoryTest < Minitest::Test
#
#   def create_skill
#     data = {
#       :name   => "a name",
#       :status => "a status"
#     }
#     skill_inventory.create(data)
#   end
#
#   include TestHelpers
#   def test_it_creates_a_skill
#     data = {
#       :name   => "a name",
#       :status => "a status"
#     }
#     skill_inventory.create(data)
#
#     skill = skill_inventory.all.last
#
#     assert_equal "a name", skill.name
#     assert_equal "a status", skill.status
#     assert skill.id
#   end
#
#   def test_can_get_all_skills
#     data1 = { name: "some skill1", status: "some status1" }
#     data2 = { name: "some skill2", status: "some status2" }
#
#     skill_inventory.create(data1)
#     skill_inventory.create(data2)
#
#     skills = skill_inventory.all
#
#     assert_instance_of Skill, skills.last
#     assert_equal 2, skills.length
#   end
#
#   def test_it_can_find_a_skill
#     data = {
#       :name   => "a name",
#       :status => "a status"
#     }
#     skill_inventory.create(data)
#
#     skill = skill_inventory.find(1)
#
#     assert skill.id
#     assert_equal "a name", skill.name
#     assert_equal "a status", skill.status
#   end
#
#   def test_can_update_skill
#     data = {
#       :name   => "a name",
#       :status => "a status"
#     }
#     skill_inventory.create(data)
#
#     skill_inventory.update(1, { "name" => "new name" })
#     skill = skill_inventory.find(1)
#
#     assert skill.id
#     assert_equal "new name", skill.name
#     assert_equal "a status", skill.status
#   end
#
#   def test_it_can_delete
#     create_skill
#
#     skill_inventory.delete(1)
#
#     skills = skill_inventory.all
#     require "pry"; binding.pry
#     assert_equal 0, skills.length
#   end
#
# end
