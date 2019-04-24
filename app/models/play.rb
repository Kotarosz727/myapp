# frozen_string_literal: true

class Play < ApplicationRecord

  validates :description, length: { maximum: 400 }
  belongs_to :user
  belongs_to :category
  has_one_attached :image
  scope :random, -> { order('RANDOM()') }

end
