class Profession < ApplicationRecord
  has_many :agent_professions
  has_many :agents, through: :agent_professions
end
