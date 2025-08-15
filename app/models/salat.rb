class Salat < ApplicationRecord
  default_scope { order(:sort, :id) }
  has_many :lines, dependent: :destroy, as: :linable
  scope :published, -> { where(published: true) }
end
