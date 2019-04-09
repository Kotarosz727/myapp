class Play < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  scope :random, -> { order("RANDOM()") }
end
