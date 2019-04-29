class Play < ApplicationRecord

  validates :description, length: { maximum: 400 }
  belongs_to :user 
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  belongs_to :category, optional: true
  has_one_attached :image
  scope :random, -> { order('RANDOM()') }

  def favorited?(user)
    favorited_users.include?(user)
  end

end
