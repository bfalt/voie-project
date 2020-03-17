class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :agent, dependent: :destroy
  has_many_attached :photos
  has_many :messages, dependent: :destroy
  has_many :job_listings, dependent: :destroy
  accepts_nested_attributes_for :agent

  validates :first_name, presence: true
  validates :last_name, presence: true
end
