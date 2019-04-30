class Play < ApplicationRecord

  validates :description, length: { maximum: 400 }
  belongs_to :user 
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  belongs_to :category, optional: true
  has_one_attached :image
  
  scope :random, -> { order('RANDOM()') }
  scope :related_plays, ->(category, number){
    where(category_id: category.id).
    includes(image_attachment: [:blob]).
    random.
    limit(number)
  }

  def favorite_user(user_id)
    favorites.find_by(user_id: user_id)
  end

end
