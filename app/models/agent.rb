class Agent < ApplicationRecord
  belongs_to :user

  has_many :offers
  has_many :messages, through: :offers
  has_many :reviews, through: :offers
  has_many :agent_professions
  has_many :professions, through: :agent_professions
end
