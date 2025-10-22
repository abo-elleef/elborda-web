class Salat < ApplicationRecord
  include AttributeTranslations
  default_scope { order(:sort, :id) }
  has_many :lines, dependent: :destroy, as: :linable
  has_many :links, dependent: :destroy, as: :linkable
  scope :published, -> { where(published: true) }
end
