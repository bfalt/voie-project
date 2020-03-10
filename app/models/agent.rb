class Agent < ApplicationRecord
  belongs_to :user

  has_many :offers
  has_many :messages, through: :offers
end
