class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :agent
  has_one_attached :photo
  has_many :messages
  has_many :job_listings
  accepts_nested_attributes_for :agent
end
