class Agent < ApplicationRecord
  belongs_to :user

  has_many :offers
  has_many :messages, through: :offers
  has_many :reviews, through: :offers
  has_many :agent_professions
  has_many :professions, through: :agent_professions

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :company_name, presence: true
  validates :company_address, presence: true
end
