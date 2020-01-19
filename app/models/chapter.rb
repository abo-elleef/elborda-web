class Chapter < ApplicationRecord
	belongs_to :poem
	has_many :lines, dependent: :destroy
	has_many :links, as: :linkable, dependent: :destroy

	accepts_nested_attributes_for :lines, allow_destroy: true
end
