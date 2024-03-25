class Werd < ApplicationRecord
	default_scope { order(:sort, :id) }
	DEFAULT_CHAPTER_SIZE = 20
	has_many :lines, dependent: :destroy, as: :linable
  scope :published, -> { where(published: true) }
end
