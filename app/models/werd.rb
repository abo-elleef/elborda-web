# frozen_string_literal: true

class Werd < ApplicationRecord
  include AttributeTranslations
  default_scope { order(:sort, :id) }
  DEFAULT_CHAPTER_SIZE = 20
  has_many :lines, dependent: :destroy, as: :linable
  has_many :links, dependent: :destroy, as: :linkable
  scope :published, -> { where(published: true) }
end
