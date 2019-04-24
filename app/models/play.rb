# frozen_string_literal: true

class Play < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :image

  scope :random, -> { order('RANDOM()') }
  # scope :related_plays, ->(category, play) {
  # category.play.
  # where.not(id: play.id).
  # limit(4).
  # distinct
  # }
end
