class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :avatar, presence: false
  has_many :plays, dependent: :destroy
  has_many :favorites
  has_many :fav_movies, through: :favorites, source: :play
  has_one_attached :avatar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
