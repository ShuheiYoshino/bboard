class User < ApplicationRecord
  has_many :topics, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :watchlists, dependent: :destroy
  has_many :topics, through: :watchlists
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 30 }
end
