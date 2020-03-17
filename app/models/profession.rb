class Profession < ApplicationRecord
  has_many :agent_professions
  has_many :agents, through: :agent_professions

  def self.formatted_selection
    Profession.all.map { |profession| [profession.category, profession.id] }
  end
end
