require 'yaml/store'
class SkillInventory
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(skill)
    database.from(:skills).insert(skill)
  end

  def all
    result = database.from(:skills).map { |data| Skill.new(data) }
  end

  def find(id)
    result = database.from(:skills).where(:id => id).to_a.first
    Skill.new(result)
  end

  def delete(id)
    database.from(:skills).where(:id => id).delete
  end

  def delete_all
  database.transaction do
    database['skills'] = []
    database['total'] = 0
    end
  end

  def update(id, skill)
    database.from(:skills).where(:id => id).update(skill)
  end

end
